import 'package:url_launcher/url_launcher.dart';

class UrlLaucher {
  static client(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  //打开浏览器
  static browser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) throw 'Could not launch $url';
  }

  //发送邮件
  static email(String email, String subject, String body) async {
    // String email = 'business@proflu.cn';
    // String subject = 'This is a test email';
    // String body = 'This is a test email body';
    Uri uri = Uri(scheme: 'mailto', path: email, queryParameters: {
      'subject': subject,
      'body': body,
    });
    String _url = uri.toString();
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  static google() async {
    // Android 谷歌地图的 scheme , 后面是北京市海淀区的经纬度
    const url = 'geo:116.3,39.95';
    if (await canLaunch(url)) {
      // Android 手机, 打开 Google 地图
      await launch(url);
    } else {
      // 如果安卓手机打不开说明是苹果手机
      const urlios = 'http://maps.apple.com/?ll=116.3,39.95';
      if (await canLaunch(urlios)) {
        await launch(urlios);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

// '打开外部浏览器', "https://cflutter.com"
// '拨打电话', "tel:10086"
// '发送短信', "sms:10086"
// QQ： mqq://
// 微信： weixin://
// 京东： openapp.jdmoble:// 测试了，好像不行
// 淘宝： taobao://
// 美团： imeituan://
// 点评： dianping://
// 1号店： wccbyihaodian://
// 支付宝： alipay://
// 微博： sinaweibo://
// 腾讯微博： TencentWeibo://
// weico微博： weico://
// 知乎： zhihu://
// 豆瓣fm： doubanradio://
// 网易公开课： ntesopen://
// Chrome： googlechrome://
// QQ浏览器： mqqbrowser://
// uc浏览器： ucbrowser://
// 搜狗浏览器： SogouMSE://
// 百度地图： baidumap:// bdmap://
// 优酷： youku://
// 人人： renren://
// 我查查： wcc://
// 有道词典： yddictproapp://
// 微盘： sinavdisk://
// 名片全能王： camcard://
}
