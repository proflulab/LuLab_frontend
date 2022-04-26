import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_plugin_record/flutter_plugin_record.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecord {
  static bool _isRecording = false;

  static final FlutterPluginRecord _recordPlugin = FlutterPluginRecord();
  static StreamSubscription? _audioSubscription;
  static Uint8List? bytes;

  ///初始化
  static init(Function onStop) async {
    _audioSubscription = _recordPlugin.response.listen((data) {
      if (data.msg == "onStop") {
        ///结束录制时会返回录制文件的地址方便上传服务器
        if (data.path != null) {
          File file = File(data.path!);
          bytes = file.readAsBytesSync();
          onStop(bytes);
        }
      } else if (data.msg == "onStart") {
        debugPrint("onStart --");
      }
    });
    await _recordPlugin.init();
  }

  ///销毁
  static dispose() {
    _audioSubscription?.cancel();
    _recordPlugin.dispose();
  }

  ///开始录音
  static Future<bool> startListening() async {
    //授权
    if (Platform.isAndroid &&
        !await Permission.microphone.request().isGranted) {
      return false;
    }
    //清空缓存
    bytes = null;
    if (_isRecording) return false;
    //开始录音
    _recordPlugin.start();
    _isRecording = true;
    return true;
  }

  static Future<bool> stopListening() async {
    if (!_isRecording) return false;
    await _recordPlugin.stop();
    _isRecording = false;
    return true;
  }

  // static Future<List<int>> currentSamples() async {
  //   return bytes!;
  // }
}
