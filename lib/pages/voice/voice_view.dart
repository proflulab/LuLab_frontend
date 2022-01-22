import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/services/services.dart';
import '../../common/utils/utils.dart';

class VoiceView extends StatefulWidget {
  const VoiceView({Key? key}) : super(key: key);

  @override
  _VoiceViewState createState() => _VoiceViewState();
}

class _VoiceViewState extends State<VoiceView> {
  String sstText = '未开始';
  String voiceResponseText = '';
  XfManage? _xf;
  bool isListening = true;
  bool visible = true;
  bool show = true;
  TextToSpeech tts = TextToSpeech();
  int a = 0;
  String values = 'assets/images/语音动效2.gif';

  @override
  void initState() {
    super.initState();
    SoundRecord.init();
    WidgetsBinding.instance?.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _xf?.close();
    SoundRecord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      margin: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        //短按打开关闭操作
        onPressed: () {
          // visible = !visible;
          // if (isListening) {
          //   tts.stop();
          //   if (show) {
          //     SoundRecord.startListening();
          //     setState(() {
          //       show = false;
          //     });
          //   } else {}
          //   SoundRecord.startListening();
          //   setState(() {
          //     isListening = false;
          //   });
          // } else if(isListening){
          //   SoundRecord.stopListening();
          //   xfSst();
          // }else{
          //
          // }
          if (a == 0) {
            tts.stop();
            SoundRecord.startListening();
            setState(() {
              isListening = false;
              a = 1;
              values = 'assets/images/语音动效 圆环.gif';
            });
          } else if (a == 1) {
            SoundRecord.stopListening();
            xfSst();
            setState(() {
              a = 2;
              values = 'assets/images/语音动效 300.gif';
            });
          } else {
            tts.stop();
            setState(() {
              a = 0;
              values = 'assets/images/语音动效2.gif';
            });
          }
        },
        //长按一下开始说话
        // onLongPress: () {
        //   // if (show) {
        //   //   SoundRecord.stopListening();
        //   //   xfSst();
        //   //   // SoundRecord.startListening();
        //   //   // SoundRecord.stopListening();
        //   //   // xfSst();
        //   //   setState(() {
        //   //
        //   //   });
        //   // }
        //   show = false;
        // },
        child:
            // visible
            //     ? TestAWidget(
            //         visible: visible,
            //       )
            //     :
            TestBWidget(
          visible: visible,
          show: show,
          values: values,
        ),
        //       if (a == 0) {
        // TestAWidget(
        //         visible: visible,
        //       )
        // ;
        // } else if (a == 1) {
        //   TestBWidget(
        //               visible: !visible,
        //               show: show,
        //         values: '',
        //             )
        //
        // } else {
        // TestEWidget(),
        // }
        // },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xffffffff)),
          shape: MaterialStateProperty.all(const CircleBorder(
              side: BorderSide(
            //设置 界面效果
            color: Colors.green,
            width: 280.0,
            style: BorderStyle.none,
          ))), //圆角弧度
        ),
      ),
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
          if (kDebugMode) {
            print(sstText);
          }
          voicegql();
        });
      },
    );
  }

  voicegql() async {
    VoiceRequest variables = VoiceRequest(
      // queryText: sstText,
      userId: 'shiming',
      queryText: sstText,
    );
    try {
      VoiceResponse voiceText = await VoiceAPI.indexPageInfo(
        context: context,
        variables: variables,
      );
      sstSpeak(text: voiceText.data.speechGoogle.msg);
      setState(() {
        isListening = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print("===========获取语音响应内容报错===============");
        print(e);
      }
    }
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
      // child: Container(
      //   color: Colors.blue,
      //   height: 100.0,
      //   child: const Center(
      //     child: Text('TestAWidget'),
      //   ),
      // ),
      child: Container(
        height: 50,
        width: 50,
        // margin: EdgeInsets.only(top: 40),
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Colors.blue,
        ),
        child: const Icon(Icons.graphic_eq),
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
        // child: Container(
        //   color: Colors.green,
        //   height: 100.0,
        //   child: const Center(
        //     child: Text('TestBWidget'),
        //   ),
        // ),

        child: Container(
          alignment: Alignment.center,
          child: ClipOval(
            child: Image.asset(values),
          ),
        )
        // show
        //     ? const SizedBox(height: 50, width: 50, child: WaterRipple())
        //     : const TestEWidget(),
        );
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
