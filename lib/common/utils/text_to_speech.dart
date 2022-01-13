import 'package:text_to_speech/text_to_speech.dart';

//执行文本转语音
void sstSpeak({
  required String text,
  double volume = 1.0,
  double rate = 1.0,
  double pitch = 1.0,
  String language = 'zh-CN',
}) {
  TextToSpeech tts = TextToSpeech();
  tts.setVolume(volume);
  tts.setRate(rate);
  tts.setLanguage(language);
  tts.setPitch(pitch);
  tts.speak(text);
}
