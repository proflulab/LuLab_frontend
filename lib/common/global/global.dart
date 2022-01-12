//import 'dart:io';

//import 'package:device_info/device_info.dart';
// import 'package:flutter/material.dart';
import '../../../../common/entitys/entitys.dart';
//import '../../provider/provider.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
//import 'package:package_info/package_info.dart';

/// 全局配置
class Global {
  /// 用户配置
  static UserLogin profile = UserLogin(
      msg: '',
      status: '',
      data: Data(
        name: 'name',
        password: 'password',
        img:
            "http://img.wxcha.com/m00/f0/f5/5e3999ad5a8d62188ac5ba8ca32e058f.jpg",
        wechat: "无",
        phone: '无',
        sex: '未知',
        description: '无',
      ));

  /// 发布渠道
  // static String channel = "xiaomi";

  // /// 是否 ios
  // static bool isIOS = Platform.isIOS;

  /// android 设备信息
  //static AndroidDeviceInfo androidDeviceInfo;

  /// ios 设备信息
  //static IosDeviceInfo iosDeviceInfo;

  /// 包信息
  //static PackageInfo packageInfo;

  /// 是否第一次打开
  // static bool isFirstOpen = false;

  /// 是否离线登录
  // static bool isOfflineLogin = false;

  /// 应用状态,
  //static AppState appState = AppState();

  /// 是否 release
  // static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    // WidgetsFlutterBinding.ensureInitialized();

    // 读取设备信息
    // DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // if (Global.isIOS) {
    //   Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    // } else {
    //   Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    // }

    // 包信息
    //Global.packageInfo = await PackageInfo.fromPlatform();

    // 工具初始
    // await StorageUtil.init();
    // HttpUtil();

    // 读取设备第一次打开
    // isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    // if (isFirstOpen) {
    //   StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    // }

    // 读取离线用户信息
    // var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    // if (_profileJSON != null) {
    //   profile = GqlUserLoginResponseEntity.fromJson(_profileJSON);
    //   isOfflineLogin = true;
    // }

    // android 状态栏为透明的沉浸
    // if (Platform.isAndroid) {
    //   SystemUiOverlayStyle systemUiOverlayStyle =
    //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }
  }

  // 持久化 用户信息
  static Future<bool?> saveProfile(UserLogin userResponse) {
    profile = userResponse;
    return Storage.setJson(storageUserProfileKey, userResponse.toJson());
  }
}
