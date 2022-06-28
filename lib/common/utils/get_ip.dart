import 'package:flutter/widgets.dart';
import 'package:r_get_ip/r_get_ip.dart';

class PFIp {
  static Future<dynamic> bubbleSort(IpType type) async {
    switch (type) {
      case IpType.externalIP:
        String? ip = await RGetIp.internalIP;
        debugPrint(ip);
        break;
      case IpType.internalIP:
        String? ip = await RGetIp.externalIP;
        debugPrint(ip);
        break;
      case IpType.networkType:
        String? ip = await RGetIp.networkType;
        debugPrint(ip);
        break;
      default:
        RGetIp.internalIP;
    }
  }
}

enum IpType {
  //局域网ip
  internalIP,
  //公网IP
  externalIP,
  //网络类型
  networkType,
}
