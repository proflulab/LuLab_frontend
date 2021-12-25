import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
  int result = await audioPlayer.play(url);
  if (result == 1) {
    // success
  }
}

//暂停播放
pausar() async {
  int result = await audioPlayer.pause();
  if (result == 1) {
    // success
  }
}

//停止播放
parar() async {
  int result = await audioPlayer.stop();
  if (result == 1) {
    // success
  }
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
