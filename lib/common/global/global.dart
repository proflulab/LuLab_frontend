import 'dart:convert';
import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
import '../../../../common/entitys/entitys.dart';

/// 全局配置
class Global {
  // 用户配置
  static Data profile = Data();

  static String token = '无';

  /// 发布渠道
  // static String channel = "xiaomi";

  /// 是否 ios
  static bool isIOS = Platform.isIOS;

  /// 包信息
  static late PackageInfo packageInfo;

  /// android 设备信息
  static late AndroidDeviceInfo androidDeviceInfo;

  /// ios 设备信息
  static late IosDeviceInfo iosDeviceInfo;

  static EventBus eventBus = EventBus();

  //static PackageInfo packageInfo;

  /// 是否第一次打开
  static bool isFirstOpen = true;

  /// 是否第一次登录
  static int isFirstSign = 1;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 应用状态,
  //static AppState appState = AppState();

  /// 是否 release
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    //获取包名、APP名称、版本号、build构建版本号
    PackageInfo info = await PackageInfo.fromPlatform();
    Global.packageInfo = info;

    //读取设备信息
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Global.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }

    // 工具初始
    // await StorageUtil.init();
    // HttpUtil();

    // 读取设备第一次打开
    Storage.getBool(storageDeviceAlreadyOpenKey).then(
      (value) async {
        isFirstOpen = value ?? true;
        print(value);
        print(isFirstOpen);
        if (isFirstOpen) {
          Storage.setBool(storageDeviceAlreadyOpenKey, false);
        }
      },
    );

    //读取离线用户信息
    Storage.getJson(storageUserProfileKey).then(
      (guide) async {
        profile = Data.fromJson(json.decode(guide!));
        isOfflineLogin = true;
      },
    );

    //android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle _style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //statusBarIconBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
  }

  // 持久化 用户信息
  static Future<bool?> saveProfile(Data userResponse) {
    profile = userResponse;
    return Storage.setJson(storageUserProfileKey, userResponse.toJson());
  }

  // 持久化 token
  static saveToken(String e) {
    token = e;
    return Storage.setString(storaTokenKey, e);
  }
}
