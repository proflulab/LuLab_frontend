import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:system_info2/system_info2.dart';
import 'package:battery_plus/battery_plus.dart';
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

class PFsystemInfo {
  static client() {
    print('Kernel architecture     : ${SysInfo.kernelArchitecture}');
    print('Kernel bitness          : ${SysInfo.kernelBitness}');
    print('Kernel name             : ${SysInfo.kernelName}');
    print('Kernel version          : ${SysInfo.kernelVersion}');
    print('Operating system name   : ${SysInfo.operatingSystemName}');
    print('Operating system version: ${SysInfo.operatingSystemVersion}');
    print('User directory          : ${SysInfo.userDirectory}');
    print('User id                 : ${SysInfo.userId}');
    print('User name               : ${SysInfo.userName}');
    print('User space bitness      : ${SysInfo.userSpaceBitness}');
    final cores = SysInfo.cores;
    print('Number of core    : ${cores.length}');
    for (final core in cores) {
      print('  Architecture          : ${core.architecture}');
      print('  Name                  : ${core.name}');
      print('  Socket                : ${core.socket}');
      print('  Vendor                : ${core.vendor}');
    }
    print('Total physical memory   '
        ': ${SysInfo.getTotalPhysicalMemory() ~/ megaByte} MB');
    print('Free physical memory    '
        ': ${SysInfo.getFreePhysicalMemory() ~/ megaByte} MB');
    print('Total virtual memory    '
        ': ${SysInfo.getTotalVirtualMemory() ~/ megaByte} MB');
    print('Free virtual memory     '
        ': ${SysInfo.getFreeVirtualMemory() ~/ megaByte} MB');
    print('Virtual memory size     '
        ': ${SysInfo.getVirtualMemorySize() ~/ megaByte} MB');
  }
}

const int megaByte = 1024 * 1024;

class PFbattery {
  static client() async {
    // Instantiate it
    var battery = Battery();
    //int a = await battery.batteryLevel;
    // Access current battery level
    //print(a);

    // Be informed when the state (full, charging, discharging) changes
    //battery.onBatteryStateChanged.listen((BatteryState state) {
    // Do something with new state
    //});
  }
}
