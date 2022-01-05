import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 引入插件
import 'package:device_info/device_info.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  void initState() {
    super.initState();
    // 获取设备信息
    _getDeviceInfo();
  }

  void _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    // 安卓系统
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (kDebugMode) {
      print('设备唯一标识: ${androidInfo.androidId}');
    }
    //更多信息请查看 AndroidDeviceInfo 类中的定义

    // 苹果系统
    // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // print('设备唯一标识：${iosInfo.identifierForVendor}');
    // 更多信息请查看 IosDeviceInfo 类中的定义
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text("设备信息"),
      ),
    );
  }
}
