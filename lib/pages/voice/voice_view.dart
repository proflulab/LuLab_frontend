import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/services/services.dart';
import '../../common/utils/utils.dart';
import '../voice/voice_cartoon.dart';

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
        onPressed: () {
          visible = !visible;
          if (isListening) {
            SoundRecord.startListening();
            setState(() {
              isListening = false;
            });
          } else {
            SoundRecord.stopListening();
            xfSst();
            //voicegql();
            //sstSpeak(text: "文本转语音测试完毕");
          }
        },
        child: visible
            ? TestAWidget(
                visible: visible,
              )
            : TestBWidget(
                visible: !visible,
              ),
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

  const TestBWidget({Key? key, required this.visible}) : super(key: key);

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
      child: const SizedBox(height: 50, width: 50, child: WaterRipple()),
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
      // child: Container(
      //   color: Colors.blue,
      //   height: 100.0,
      //   child: const Center(
      //     child: Text('TestAWidget'),
      //   ),
      // ),
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
