import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:porcupine_flutter/porcupine_error.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/services/services.dart';
import '../../common/utils/utils.dart';
import 'voice_widget.dart';

class VoiceView extends StatefulWidget {
  const VoiceView({Key? key}) : super(key: key);

  @override
  _VoiceViewState createState() => _VoiceViewState();
}

class _VoiceViewState extends State<VoiceView>
    with AutomaticKeepAliveClientMixin {
  String sstText = '未开始';
  String voiceResponseText = '';
  XfManage? _xf;
  bool isListening = true;
  bool visible = true;
  bool show = true;
  TextToSpeech tts = TextToSpeech();
  int a = 0;
  int b = 0;
  String values = 'assets/images/语音动效2.gif';
  PorcupineManager? _porcupineManager;
  //换上自己的appid
  final accessKey = "5g6pH3j4toOHCQzJvGl1rILxyGQ5YAljKT6O8bvbqUlCef46i//alg==";
  String strTitle = '';
  String strTime = '';
  String strDescription = '';

  @override
  void initState() {
    super.initState();
    SoundRecord.init();
    WidgetsBinding.instance?.addPostFrameCallback((_) {});
    createPorcupineManager();
    _porcupineManager?.start();
  }

  void createPorcupineManager() async {
    try {
      _porcupineManager = await PorcupineManager.fromKeywordPaths(
          accessKey, ["assets/ppn/three_android.ppn"], wakeWordCallback);
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
      YYDialog.init(context);
      sstSpeak(text: '我在，你有什么问题');
      yYFixTextFieldDialog();
      // tts.stop();
      // sstSpeak(text: '我在，你有什么问题');
      // Future.delayed(const Duration(milliseconds: 2850), () {
      //   SoundRecord.startListening();
      //   Future.delayed(const Duration(seconds: 5), () {
      //     SoundRecord.stopListening();
      //     xfSst();
      //   });
      // });
    }
  }

  @override
  void dispose() {
    _xf?.close();
    SoundRecord.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 80.0,
      width: 80.0,
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTapDown: (tapDown) {
          yYFixTextFieldDialog();

          if (kDebugMode) {
            print("按下 ");
          }
          tts.stop();
          SoundRecord.startListening();
          setState(() {
            isListening = false;
            values = 'assets/images/语音动效 圆环.gif';
          });
        },
        onTapUp: (tapUp) {
          if (kDebugMode) {
            print("抬起 ");
          }
          SoundRecord.stopListening();
          xfSst();
          setState(() {
            values = 'assets/images/语音动效2.gif';
          });
        },
        child: TestBWidget(
          visible: visible,
          show: show,
          values: values,
        ),
      ),
      //原版点按语音交互
      // ElevatedButton(
      //   //短按打开关闭操作
      //   onPressed: () {
      //     //第一版点击内容效果
      //     if (a == 0) {
      //       tts.stop();
      //       SoundRecord.startListening();
      //       setState(() {
      //         isListening = false;
      //         a = 1;
      //         values = 'assets/images/语音动效 圆环.gif';
      //       });
      //     } else if (a == 1) {
      //       SoundRecord.stopListening();
      //       xfSst();
      //       setState(() {
      //         a = 2;
      //         values = 'assets/images/语音动效 300.gif';
      //       });
      //     } else {
      //       tts.stop();
      //       setState(() {
      //         a = 0;
      //         values = 'assets/images/语音动效2.gif';
      //       });
      //     }
      //   },
      //   child: TestBWidget(
      //     visible: visible,
      //     show: show,
      //     values: values,
      //   ),
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.all(const Color(0xffffffff)),
      //     shape: MaterialStateProperty.all(const CircleBorder(
      //         side: BorderSide(
      //       //设置 界面效果
      //       color: Colors.green,
      //       width: 280.0,
      //       style: BorderStyle.none,
      //     ))), //圆角弧度
      //   ),
      // ),
    );
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
            b = 1;
          }
          voicegql();
        });
      },
    );
  }

  voicegql() async {
    VoiceRequest variables = VoiceRequest(
      // queryText: sstText,
      userId: Global.profile.id!,
      queryText: sstText,
    );
    try {
      VoiceResponse voiceText = await VoiceAPI.indexPageInfo(
        context: context,
        variables: variables,
      );
      // String a = voiceText.speechGoogle.code;
      sstSpeak(text: voiceText.speechGoogle.msg);
      setState(() {
        isListening = true;
      });
      // if (a == "1") {
      //   print('---------------------');
      //   strTitle = voiceText.speechGoogle.detail
      //       .substring(0, voiceText.speechGoogle.subBreak[1]);
      //   strTime = voiceText.speechGoogle.detail.substring(
      //       voiceText.speechGoogle.subBreak[1],
      //       voiceText.speechGoogle.subBreak[2]);
      //   strDescription = voiceText.speechGoogle.detail.substring(
      //       voiceText.speechGoogle.subBreak[2],
      //       voiceText.speechGoogle.subBreak[3]);
      //   int intTime = int.parse(strTime);
      //   Calendar.createEvent(
      //     strTitle,
      //     strDescription,
      //     DateTime.fromMillisecondsSinceEpoch(intTime),
      //     90,
      //   );
      // }
    } catch (e) {
      if (kDebugMode) {
        print("===========获取语音响应内容报错===============");
        print(e);
      }
    }
  }

  YYDialog yYFixTextFieldDialog() {
    return YYDialog().build(context)
      ..width = 750.w
      // ..height = 450.h
      ..backgroundColor = Colors.white
      ..borderRadius = 10.0
      ..widget(const VoiceWidget(
        type: 4,
      ))
      ..show(0.0, 350.0);
  }
}

class TestAWidget extends StatelessWidget {
  final bool visible;

  const TestAWidget({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Colors.blue,
        ),
        child: const Icon(Icons.graphic_eq),
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

class TestBWidget extends StatelessWidget {
  final bool visible;
  final bool show;
  final String values;

  const TestBWidget(
      {Key? key,
      required this.visible,
      required this.show,
      required this.values})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: visible ? 1.0 : 0.0,
        child: Container(
          alignment: Alignment.center,
          child: ClipOval(
            child: Image.asset(values),
          ),
        ));
  }
}

class TestEWidget extends StatelessWidget {
  const TestEWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ClipOval(
        child: Image.asset("assets/images/20220116223044.gif"),
      ),
    );
  }
}

class TestCWidget extends StatelessWidget {
  final bool show;
  final String text;

  const TestCWidget({Key? key, required this.show, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: show ? 1.0 : 0.0,
      child: Container(
        height: 20.0,
        color: Colors.blue,
        child: Text(text),
      ),
    );
  }
}

class TestDWidget extends StatelessWidget {
  final bool show;
  final String text;

  const TestDWidget({Key? key, required this.show, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: show ? 1.0 : 0.0,
      child: Container(
        height: 50.0,
        width: 300.0,
        color: Colors.blue,
        child: Text(text),
      ),
    );
  }
}
