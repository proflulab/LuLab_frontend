import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:wakelock/wakelock.dart';

class TTsUtil {
  FlutterTts tts = FlutterTts();

  //执行文本转语音
  void sstSpeak({
    required String text,
    double volume = 1.0,
    double? rate,
    double pitch = 1.0,
    String language = 'zh-CN',
  }) {
    tts.setVolume(volume);
    tts.setSpeechRate(rate ?? (Platform.isIOS ? 0.5 : 1));
    tts.setLanguage(language);
    tts.setPitch(pitch);
    tts.speak(text);
    Wakelock.enable();
  }

  void stop() {
    tts.stop();
  }

  void setCompletionHandler(Function handler) {
    tts.setCompletionHandler(() {
      handler();
      Wakelock.disable();
    });
  }
}
