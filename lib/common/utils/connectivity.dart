import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import '../widget/widgets.dart';

class NetState {
  static network() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (kDebugMode) {
        print("处于手机网络");
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (kDebugMode) {
        print("处于WiFi网络");
      }
    } else {
      toastInfo(msg: '无法连接至网络');
    }

    // var subscription;
    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.wifi) {
    //   } else if (result == ConnectivityResult.mobile) {
    //   } else {}
    // });
  }
}
