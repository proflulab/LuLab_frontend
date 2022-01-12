import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../voice/voice_cartoon.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/services/services.dart';

class VoiceView extends StatefulWidget {
  const VoiceView({Key? key}) : super(key: key);

  @override
  _VoiceViewState createState() => _VoiceViewState();
}

class _VoiceViewState extends State<VoiceView> {
  String voiceResponseText = '';
  String msgText = '等待中...';
  XfManage? _xf;
  bool isListening = true;
  bool visible = true;

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

  late stt.SpeechToText speech;
  String text = '';
  double conf = 1.0;

  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    SoundRecord.init();
    textEditingController.text = text;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initLanguages();
    });
    // _loadAllData();
  }

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
        onPressed: () async {
          visible = !visible;
          // show = !show;
          if (isListening) {
            await SoundRecord.startListening();
            setState(() {
              msgText = '录音中..';
              isListening = false;
            });
          } else {
            connect();
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
  }

  connect() async {
    // MicRecord.stopListening();
    await SoundRecord.stopListening();
    setState(() {
      msgText = '录音停止,正在语音转文字...';
    });

    _xf = XfManage.connect(
      ViocePort.host,
      ViocePort.apiKey,
      ViocePort.apiSecret,
      ViocePort.appId,
      await SoundRecord.currentSamples(),
      (msg) {
        setState(() {
          voiceResponseText = msg;
          if (kDebugMode) {
            print(msg);
          }
        });
      },
    );
    VoiceRequest variables = VoiceRequest(
      queryText: voiceResponseText,
      userId: '宇轩',
    );
    try {
      if (kDebugMode) {
        print('----------------------------------------------');
        print(voiceResponseText);
      }
      VoiceResponse voiceText = await VoiceAPI.indexPageInfo(
        context: context,
        variables: variables,
        schema: '',
      );
      tts.setVolume(volume);
      tts.setRate(rate);
      if (languageCode != null) {
        tts.setLanguage(languageCode!);
      }
      tts.setPitch(pitch);
      tts.speak(voiceText.data.speechGoogle.msg);
    } catch (e) {
      if (kDebugMode) {
        print("===========报错内容===============");
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
        // width: 300.0,
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
