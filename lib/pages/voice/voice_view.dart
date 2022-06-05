import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:lab/controller/index_controller.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/services/services.dart';
import '../../common/utils/utils.dart';

class VoiceView extends StatefulWidget {
  const VoiceView({Key? key}) : super(key: key);

  @override
  _VoiceViewState createState() => _VoiceViewState();
}

class _VoiceViewState extends State<VoiceView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      margin: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onLongPressStart: (c) {
          IndexController.to.startSpeaking();
        },
        onLongPressEnd: (c) {
          IndexController.to.stopSpeaking();
        },
        child: GetBuilder<IndexController>(builder: (ic) {
          return Container(
            alignment: Alignment.center,
            child: ClipOval(
              child: Lottie.asset(
                  "assets/animation/${ic.speaking ? 'speaking2' : 'speaking'}.json"),
            ),
          );
        }),
      ),
    );
  }
}

class VoiceDetail extends StatefulWidget {
  const VoiceDetail({Key? key}) : super(key: key);

  @override
  State<VoiceDetail> createState() => _VoiceDetailState();
}

class _VoiceDetailState extends State<VoiceDetail> {
  XfManage? _xf;
  String sstText = '未开始';
  String title = '请说，我在聆听...';
  int a = 0;
  @override
  void initState() {
    super.initState();
    voice();
  }

  voice() async {
    sstSpeak(text: '我在，你有什么问题');
    Future.delayed(const Duration(milliseconds: 2850), () {
      SoundRecord.startListening();
      Future.delayed(const Duration(seconds: 5), () {
        SoundRecord.stopListening();
        xfSst();
      });
    });
  }

  voicegql() async {
    VoiceRequest variables = VoiceRequest(
      userId: Global.profile.id!,
      queryText: sstText,
    );
    try {
      VoiceResponse voiceText = await VoiceAPI.indexPageInfo(
        context: context,
        variables: variables,
      );
      sstSpeak(text: voiceText.speechGoogle.msg);
    } catch (e) {
      if (kDebugMode) {
        print("===========获取语音响应内容报错===============");
        print(e);
      }
    }
  }

  xfSst() async {
    _xf = XfManage.connect(
      ViocePort.host,
      ViocePort.apiKey,
      ViocePort.apiSecret,
      ViocePort.appId,
      await SoundRecord.currentSamples(),
      (msg) {
        setState(() {
          sstText = msg;
          if (sstText == '') {
            title = '未能识别，请点击语音按钮重试';
          } else {
            a = 1;
          }
          voicegql();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return a == 0
        ? SizedBox(
            height: 450.h,
            width: 750.w,
            child: Stack(children: [
              Positioned(
                top: 50.0.h,
                left: 210.0.w,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    //文本的相关参数
                    color: Colors.green,
                    fontSize: 22.0,
                  ),
                ),
              ),
              Positioned(
                top: 150.0.h,
                left: 140.w,
                child: SizedBox(
                  height: 100.0.h,
                  width: 480.w,
                  child: const Text(
                    '你可以试试这样说：陆向谦实验室、预约课程、今日热点新闻',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //文本的相关参数
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 280.0.h,
                left: 130.0.w,
                child: SizedBox(
                  height: 50.h,
                  width: 500.w,
                  child: Image.asset(
                    'assets/images/波浪线.gif',
                  ),
                ),
              ),
            ]),
          )
        : const VoiceSpeak();
  }
}

class VoiceSpeak extends StatefulWidget {
  const VoiceSpeak({Key? key}) : super(key: key);

  @override
  State<VoiceSpeak> createState() => _VoiceSpeakState();
}

class _VoiceSpeakState extends State<VoiceSpeak> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      width: 750.w,
      child: //图片蒙层背景的实现
          Stack(
        children: <Widget>[
          // //图片加载loading
          // Center(child: new CircularProgressIndicator()),
          //第一层是背景图
          Positioned(
            top: 50.0.h,
            left: 230.0.w,
            child: SizedBox(
              height: 200.h,
              width: 300.w,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
          Positioned(
            top: 280.0.h,
            left: 135.0.w,
            child: SizedBox(
              height: 50.h,
              width: 500.w,
              child: Image.asset(
                'assets/images/发光条.gif',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
