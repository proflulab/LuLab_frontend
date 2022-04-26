import 'package:flutter_tts/flutter_tts.dart';

class TTsUtil {
  FlutterTts tts = FlutterTts();

  //执行文本转语音
  void sstSpeak({
    required String text,
    double volume = 1.0,
    double rate = 1.0,
    double pitch = 1.0,
    String language = 'zh-CN',
  }) {
    tts.setVolume(volume);
    tts.setSpeechRate(rate);
    tts.setLanguage(language);
    tts.setPitch(pitch);
    tts.speak(text);
  }

  void stop() {
    tts.stop();
  }

  void setCompletionHandler(Function handler) {
    tts.setCompletionHandler(() {
      handler();
    });
  }
}
