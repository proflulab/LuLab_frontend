import 'package:get/get.dart';
import 'package:tobias/tobias.dart' as tobias;
import 'package:fluwx/fluwx.dart';

import '../widget/toast.dart';

class PayUtil {
  /// 支付宝支付
  static toAli(orderInfo) async {
    //检测是否安装支付宝
    var result = await tobias.isAliPayInstalled();
    if (result) {
      var payResult = await tobias.aliPay(orderInfo);
      if (payResult['result'] != null) {
        if (payResult['resultStatus'] == '9000') {
          toastInfo(msg: "支付宝支付成功");
          Get.back(result: true);
        } else if (payResult['resultStatus'] == '6001') {
          toastInfo(msg: "支付宝支付失败");
        } else {
          toastInfo(msg: "未知错误");
        }
      }
    } else {
      toastInfo(msg: "未安装支付宝");
    }
  }

  /// 微信支付
  static toWechat(orderInfo) async {
    /// 判断手机上是否安装微信
    var result = await isWeChatInstalled;
    if (result) {
      await payWithWeChat(
        appId: orderInfo['appid'],
        partnerId: orderInfo['partnerid'],
        prepayId: orderInfo['prepayid'],
        packageValue: orderInfo['package'],
        nonceStr: orderInfo['noncestr'],
        timeStamp: int.parse(orderInfo['timestamp']),
        sign: orderInfo['paySign'],
      );
      weChatResponseEventHandler.distinct().listen((event) {
        if (event.errCode == 0) {
          toastInfo(msg: "支付成功");
          Get.back(result: true);
        } else {
          toastInfo(msg: "支付失败");
        }
      });
    } else {
      toastInfo(msg: '该手机上未安装微信,请选择其他支付方式');
    }
  }
}

//app_id=2015052600090779&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.02%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%22314VYGIAGG7ZOYY%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA2&timestamp=2016-08-15%2012%3A12%3A15&version=1.0&sign=MsbylYkCzlfYLy9PeRwUUIg9nZPeN9SfXPNavUCroGKR5Kqvx0nEnd3eRmKxJuthNUx4ERCXe552EV9PfwexqW%2B1wbKOdYtDIb4%2B7PL3Pc94RZL0zKaWcaY3tSL89%2FuAVUsQuFqEJdhIukuKygrXucvejOUgTCfoUdwTi7z%2BZzQ%3D
//接口参数
//https://opendocs.alipay.com/open/02e7gq?scene=20


// app_id=2014072300007148&charset=UTF-8&version=1.0&timestamp=2016-07-01 08:08:08&method=alipay.trade.app.pay&notify_url=https://api.**.com/pay_receive_notify.html&sign_type=RSA2&sign=ERITJKEIJKJHKKKKKKKHJEREEEEEEEEEEE&version=1.0&biz_content=
// {
//   "body":"对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。",
//   "subject":"大乐透",
//   "out_trade_no":"70501111111S001111119",
//   "timeout_express":"90m",
//   "total_amount":"一共花费了10元",
//   "product_code":"QUICK_MSECURITY_PAY",
//   "tips":"测试一笔支付"
//   }




//iOS/Runner/Info.plist内配置
//放在最高级的dict内


	// <key>LSApplicationQueriesSchemes</key>
	// <array>
	// 	<string>https</string>
	// 	<string>http</string>
	// 	<string>weixin</string>
	// 	<string>weixinULAPI</string>
  //       <string>alipays</string>
	// </array>
	// <key>CFBundleURLTypes</key>
	// <array>
  //       <dict>
  //           <key>CFBundleTypeRole</key>
  //           <string>Editor</string>
  //           <key>CFBundleURLName</key>
  //           <string>alipay</string>
  //           <key>CFBundleURLSchemes</key>
  //           <array>
  //               <string>tobiasexample</string>
  //           </array>
  //       </dict>
  //   </array>

