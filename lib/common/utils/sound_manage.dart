import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:permission_handler/permission_handler.dart';
import 'package:sound_stream/sound_stream.dart';

class SoundRecord {
  static bool _isRecording = false;

  static final RecorderStream _recorder = RecorderStream();
  static StreamSubscription? _audioSubscription;
  static final List<Uint8List> _currentSamples = [];

  ///初始化
  static init() async {
    _audioSubscription = _recorder.audioStream.listen((data) {
      // print('_currentSamples: $data');
      _currentSamples.add(data);
    });
    await _recorder.initialize();
  }

  ///销毁
  static dispose() {
    _audioSubscription?.cancel();
  }

  ///开始录音
  static Future<bool> startListening() async {
    //授权
    if (Platform.isAndroid &&
        !await Permission.microphone.request().isGranted) {
      return false;
    }
    //清空缓存
    _currentSamples.clear();
    if (_isRecording) return false;
    //开始录音
    await _recorder.start();
    _isRecording = true;
    return true;
  }

  static Future<bool> stopListening() async {
    if (!_isRecording) return false;
    await _recorder.stop();
    _isRecording = false;
    return true;
  }

  static Future<List<int>> currentSamples() async {
    List<int> list = [];
    for (var element in _currentSamples) {
      list.addAll(element);
    }
    return list;
  }
}
