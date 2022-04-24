import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

/*
    * @description:  获取设备信息
    * @return {type} 设备信息
    */
Future<dynamic> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    if (kDebugMode) {
      print('IOS设备');
    }
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo;
  } else if (Platform.isAndroid) {
    if (kDebugMode) {
      print('Android设备');
    }
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo;
  }
}

//  获取设备的指定信息
class FlutterDeviceInfo {
  // 获取设备的唯一标识 uuid
  static Future<String> get platformUid async {
    var data = await getDeviceInfo(), res;
    if (Platform.isIOS) {
      res = data.identifierForVendor;
    } else if (Platform.isAndroid) {
      res = data.androidId;
    }
    return res;
  }

  //  获取设备name
  static Future<String> get platformName async {
    var data = await getDeviceInfo(), res;
    if (Platform.isIOS) {
      res = data.name;
    } else if (Platform.isAndroid) {
      res = data.device;
    }
    return res;
  }

  // 获取设备的model
  static Future<String> get platformModel async {
    var data = await getDeviceInfo(), res;
    if (Platform.isIOS) {
      res = data.utsname.machine;
    } else if (Platform.isAndroid) {
      res = data.brand + ' ' + data.model;
    }
    return res;
  }
}
