import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proflu/pages/voice/voicepage.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'dart:async';
import 'package:text_to_speech/text_to_speech.dart';

import 'pages/course/course_page.dart';
import 'pages/home/home_page.dart';
import 'pages/source/Information_page.dart';
import 'pages/users/users_page.dart';
import 'pages/voice/voice_donghua.dart';
// import 'VoiceAI/sound_manage.dart';
// import 'VoiceAI/voice_donghua.dart';
// import 'VoiceAI/xf_manage.dart';
import 'utils/sound_manage.dart';
import 'utils/xf_manage.dart';
import 'values/myicon.dart';

const host = 'iat-api.xfyun.cn';
const appId = '552cfd88';
const apiKey = 'ba3a615422f1580076a2bf8eae3debca';
const apiSecret = 'NWZjZDZkOGE4ZmFkOGEyZjkyZjA5MWQz';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String msg = '等待中...';
  XfManage? _xf;
  bool isListening = true;
  bool visible = true;
  // bool show = true;
  int _currentIndex = 0;
  final String defaultLanguage = 'zh-CN';
  TextToSpeech tts = TextToSpeech();
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0; // Range: 0-2

  String? language;
  String? languageCode;
  List<String> languages = <String>[];
  List<String> languageCodes = <String>[];
  String? voice;

  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    SoundRecord.init();
    textEditingController.text = text;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initLanguages();
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   SoundRecord.init();
  // }

  Future<void> initLanguages() async {
    /// populate lang code (i.e. en-US)
    languageCodes = await tts.getLanguages();

    /// populate displayed language (i.e. English)
    final List<String>? displayLanguages = await tts.getDisplayLanguages();
    if (displayLanguages == null) {
      return;
    }

    languages.clear();
    for (final dynamic lang in displayLanguages) {
      languages.add(lang as String);
    }

    final String? defaultLangCode = await tts.getDefaultLanguage();
    if (defaultLangCode != null && languageCodes.contains(defaultLangCode)) {
      languageCode = defaultLangCode;
    } else {
      languageCode = defaultLanguage;
    }
    language = await tts.getDisplayLanguageByCode(languageCode!);

    /// get voice
    voice = await getVoiceByLang(languageCode!);

    if (mounted) {
      setState(() {});
    }
  }

  Future<String?> getVoiceByLang(String lang) async {
    final List<String>? voices = await tts.getVoiceByLang(languageCode!);
    if (voices != null && voices.isNotEmpty) {
      return voices.first;
    }
    return null;
  }

  final List _pageList = [
    const HomePage(),
    const CoursePage(),
    const VoicePage(),
    const InformationPage(),
    const UsersPage(),
  ];
  late stt.SpeechToText speech;
  String text = '对不起现在我还没有接收到后端的数据';
  double conf = 1.0;

  @override
  void dispose() {
    _xf?.close();
    SoundRecord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 语音识别按钮
        floatingActionButton: Stack(
          children: <Widget>[
            Positioned(
              //其他的组件加上去以这种形式
              bottom: 10.0,
              left: 143.0,
              child: Container(
                height: 80.0,
                width: 80.0,
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    visible = !visible;
                    // show = !show;
                    if (isListening) {
                      await SoundRecord.startListening();
                      // setState(() => isListening = false);
                      setState(() {
                        msg = '录音中..';
                        isListening = false;
                      });
                    } else {
                      connect();
                      speak();
                      // visible = !visible;
                    }
                    // setState(() {
                    //   _msg = '录音中..';
                    // });
                  },
                  child: visible
                      ? TestAWidget(
                          visible: visible,
                        )
                      : TestBWidget(
                          visible: !visible,
                        ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffffffff)),
                    shape: MaterialStateProperty.all(const CircleBorder(
                        side: BorderSide(
                      //设置 界面效果
                      color: Colors.green,
                      width: 280.0,
                      style: BorderStyle.none,
                    ))), //圆角弧度
                  ),
                ),
              ),
            ),
            // new Positioned(
            //   bottom: 80.0,
            //   left: 35.0,
            //   child: show
            //       ? TestCWidget(
            //           show: show,
            //           text: msg,
            //         )
            //       : TestDWidget(
            //           show: !show,
            //           text: msg,
            //         ),
            // )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _pageList[_currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            // 去掉水波纹效果
            splashColor: Colors.transparent,
            // 去掉长按效果
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            // 选中图标主题
            selectedIconTheme: const IconThemeData(
              // 图标颜色
              color: Colors.blue,
              // 图标大小
              size: 28,
              // 图标透明度
              opacity: 1.0,
            ),
            //未选中图标主题
            unselectedIconTheme: const IconThemeData(
              color: Colors.black,
              size: 26,
              opacity: 1,
            ),

            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconHomeDefault),
                  activeIcon: Icon(MyIcon.navIconHomeSelected),
                  label: ('首页'),
                  //去掉长按提示语
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconCourseDefault),
                  activeIcon: Icon(MyIcon.navIconCourseSelected),
                  label: ('课程'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sms), label: (''), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconFindDefault),
                  activeIcon: Icon(MyIcon.navIconFindSelected),
                  label: ('资讯'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconUserDefault),
                  activeIcon: Icon(MyIcon.navIconUserSelected),
                  label: ('我的'),
                  tooltip: '')
            ],
          ),
        ));
  }

  connect() async {
    // MicRecord.stopListening();
    await SoundRecord.stopListening();
    setState(() {
      msg = '录音停止,正在语音转文字...';
      isListening = true;
    });

    _xf = XfManage.connect(
      host,
      apiKey,
      apiSecret,
      appId,
      // await MicRecord.currentSamples(),
      await SoundRecord.currentSamples(),
      (msg) {
        setState(() {
          msg = '语音转文字完成: \r\n$msg';
          if (kDebugMode) {
            print(msg);
          }
        });
      },
    );
    if (kDebugMode) {
      print(msg);
    }
  }

  void speak() {
    // visible = !visible;
    tts.setVolume(volume);
    tts.setRate(rate);
    if (languageCode != null) {
      tts.setLanguage(languageCode!);
    }
    tts.setPitch(pitch);
    tts.speak(text);
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
        // width: 300.0,
        color: Colors.blue,
        child: Text(text),
      ),
    );
  }
}

// class TestDWidget extends StatelessWidget {
//   final bool show;
//   final String text;
//
//   const TestDWidget({Key? key, required this.show, required this.text})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       duration: const Duration(milliseconds: 300),
//       opacity: show ? 1.0 : 0.0,
//       child: Container(
//         height: 50.0,
//         width: 300.0,
//         color: Colors.blue,
//         child: Text(text),
//       ),
//     );
//   }
// }
