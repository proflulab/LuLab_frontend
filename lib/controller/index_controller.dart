import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porcupine_flutter/porcupine_error.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';
import 'package:proflu/common/global/global.dart';
import 'package:proflu/common/services/voice_port_server.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../common/api/gql_voice.dart';
import '../common/entitys/data_voice.dart';
import '../common/entitys/speaking_status.dart';
import '../common/utils/utils.dart';

class IndexController extends GetxController {
  static IndexController get to => Get.find();

  List<String> hints = [
    "“预约直播课”",
    "“了解陆向谦实验室”",
    "“听创业快讯”",
  ];

  /// 当前状态
  SpeakingStatus status = SpeakingStatus.userSpeaking;

  bool speaking = false;

  String userWord = '';
  XfManage? _xf;
  TextToSpeech tts = TextToSpeech();
  int a = 0;
  int b = 0;
  PorcupineManager? _porcupineManager;
  //换上自己的appid
  final accessKey = "5g6pH3j4toOHCQzJvGl1rILxyGQ5YAljKT6O8bvbqUlCef46i//alg==";

  @override
  void onInit() {
    super.onInit();
    SoundRecord.init();
    createPorcupineManager();
    _porcupineManager?.start();
  }

  void createPorcupineManager() async {
    try {
      _porcupineManager = await PorcupineManager.fromKeywordPaths(
          accessKey,
          [
            "assets/ppn/${Platform.isAndroid ? 'three_android' : 'three_ios.ppn'}.ppn"
          ],
          wakeWordCallback);
    } on PorcupineException catch (err) {
      // handle porcupine init error
    }
    try {
      await _porcupineManager?.start();
    } on PorcupineException catch (ex) {
      // deal with either audio exception
    }
  }

  void wakeWordCallback(int keywordIndex) {
    if (keywordIndex >= 0) {
      sstSpeak(text: '我在，你有什么问题');
      IndexController.to.startSpeaking();
    }
  }

  void startSpeaking({bool wakeUp = false}) {
    debugPrint("按下 ");

    speaking = true;
    status = SpeakingStatus.userSpeaking;
    userWord = "";
    update();
    if (!wakeUp) {
      tts.stop();
    }
    SoundRecord.startListening();
  }

  void stopSpeaking() {
    // speaking = false;
    // update();
    SoundRecord.stopListening();
    xfSst();
  }

  void closeDialog() {
    speaking = false;
    update();
  }

  xfSst() async {
    _xf = XfManage.connect(
      ViocePort.host,
      ViocePort.apiKey,
      ViocePort.apiSecret,
      ViocePort.appId,
      await SoundRecord.currentSamples(),
      (msg) {
        userWord = msg;
        if (userWord == '') {
          status = SpeakingStatus.parseFailed;
          update();
        } else {
          voicegql();
        }
      },
    );
  }

  voicegql() async {
    VoiceRequest variables = VoiceRequest(
      // queryText: sstText,
      userId: Global.profile.id!,
      queryText: userWord,
    );
    try {
      VoiceResponse voiceText = await VoiceAPI.indexPageInfo(
        context: Get.context!,
        variables: variables,
      );
      // speaking = true;
      // String a = voiceText.speechGoogle.code;
      status = SpeakingStatus.aiSpeaking;
      sstSpeak(text: voiceText.speechGoogle.msg);
      update();
    } catch (e) {
      status = SpeakingStatus.parseFailed;
      update();

      print("===========获取语音响应内容报错===============");
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _xf?.close();
    SoundRecord.dispose();
  }
}
