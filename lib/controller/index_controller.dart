import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porcupine_flutter/porcupine.dart';
import 'package:porcupine_flutter/porcupine_error.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';
import 'package:proflu/common/global/global.dart';
import 'package:proflu/common/services/voice_port_server.dart';

import '../common/api/gql_voice.dart';
import '../common/entitys/data_voice.dart';
import '../common/entitys/speaking_status.dart';
import '../common/utils/utils.dart';

class IndexController extends GetxController {
  static IndexController get to => Get.find();

  TTsUtil ttsUtil = TTsUtil();

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
  int a = 0;
  int b = 0;
  PorcupineManager? _porcupineManager;
  //换上自己的appid
  final accessKey = "3XdU30LgU+easZayAO9asvgjaxHZDHnwryhb4+iZRKGg1HN+WEhjLA==";

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    SoundRecord.init(xfSst);
    createPorcupineManager();
    _porcupineManager?.start();
    ttsUtil.setCompletionHandler(() {
      audioPlayer.stop();
      closeDialog();
    });
  }

  void createPorcupineManager() async {
    try {
      _porcupineManager = await PorcupineManager.fromBuiltInKeywords(
          accessKey, [BuiltInKeyword.HEY_SIRI], wakeWordCallback);
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
      ttsUtil.sstSpeak(text: '我在，你有什么问题');
      startSpeaking();
      Future.delayed(const Duration(seconds: 8), () {
        stopSpeaking();
      });
    }
  }

  int? pressTime;

  void startSpeaking({bool wakeUp = false}) {
    debugPrint("按下 ");
    pressTime = DateTime.now().millisecondsSinceEpoch;
    Future.delayed(const Duration(seconds: 60)).then((value) {
      if (speaking &&
          DateTime.now().millisecondsSinceEpoch - pressTime! < 61000) {
        stopSpeaking();
      }
    });
    speaking = true;
    status = SpeakingStatus.userSpeaking;
    userWord = "";
    update();
    if (!wakeUp) {
      ttsUtil.stop();
    }
    SoundRecord.startListening();
  }

  void stopSpeaking() {
    debugPrint("抬起 ");

    // speaking = false;
    // update();
    SoundRecord.stopListening();
    // xfSst();
  }

  void closeDialog() {
    speaking = false;
    ttsUtil.stop();
    update();
  }

  xfSst(List<int> data) async {
    _xf = XfManage.connect(
      ViocePort.host,
      ViocePort.apiKey,
      ViocePort.apiSecret,
      ViocePort.appId,
      data,
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
      print(voiceText.speechGoogle.toJson());
      if (voiceText.speechGoogle.code == "1") {
        /// 需要先放背景，再说话
        audioPlayer.setReleaseMode(ReleaseMode.stop);

        ///
        audioPlayer.play(
          AssetSource("audios/code1.mp3"),
          volume: 1.0,
        );

        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          ttsUtil.sstSpeak(text: voiceText.speechGoogle.msg);
        });
      } else if (voiceText.speechGoogle.code == "2") {
        /// 一边说一边播放可以么
        audioPlayer.play(
          AssetSource("audios/code2.mp3"),
          volume: 0.3,
        );
        audioPlayer.setReleaseMode(ReleaseMode.loop);
        ttsUtil.sstSpeak(text: voiceText.speechGoogle.msg);
      } else if (voiceText.speechGoogle.code == "4") {
        closeDialog();
      } else {
        ttsUtil.sstSpeak(text: voiceText.speechGoogle.msg);
      }

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
    audioPlayer.dispose();
    SoundRecord.dispose();
  }
}
