import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioPlayer audioPlayer = AudioPlayer();
bool firstExecuting = true;
double volume = 0.5;

//播放音乐
executar(
  String url,
) async {
  audioPlayer.setVolume(volume);

  // if (firstExecuting) {
  //   audioPlayer = await _audioCache.play("bach.mp3");
  //   firstExecuting = false;
  // } else {
  //   audioPlayer.resume();
  // }
  // String url =
  //     "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3";
  UrlSource source = UrlSource(url);
  audioPlayer.play(source);
}

playAssetAudio(String asset) {}

//暂停播放
pausar() async {
  audioPlayer.pause();
}

//停止播放
parar() async {
  audioPlayer.stop();
}

//调节音量
Widget adjustment({
  required BuildContext context,
}) {
  return Slider(
      value: volume,
      min: 0,
      max: 1,
      //divisions: 10,
      onChanged: (novoVolume) {
        // setState(() {
        //   volume = novoVolume;
        // });
        audioPlayer.setVolume(novoVolume);
      });
}
