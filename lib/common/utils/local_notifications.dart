// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// /// 通知封装
// /// author Shendi
// class Notification {
//   final FlutterLocalNotificationsPlugin np = FlutterLocalNotificationsPlugin();

//   /// 是否初始化了
//   var isInit = false;

//   /// 初始化
//   void init() {
//     if (isInit) return;
//     isInit = true;

//     var android = const AndroidInitializationSettings("logo");
//     var ios = const IOSInitializationSettings();

//     np.initialize(InitializationSettings(android: android, iOS: ios));
//   }

//   void send(String title, String body) {
//     // 初始化
//     init();

//     // 构建描述
//     var androidDetails = const AndroidNotificationDetails('id描述', '名称描述',
//         importance: Importance.max, priority: Priority.high);
//     var iosDetails = const IOSNotificationDetails();
//     var details = NotificationDetails(android: androidDetails, iOS: iosDetails);

//     // 显示通知, 第一个参数是id,id如果一致则会覆盖之前的通知
//     np.show(DateTime.now().millisecondsSinceEpoch >> 10, title, body, details);
//   }

//   Future<void> showNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails('your channel id', 'your channel name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await np.show(DateTime.now().millisecondsSinceEpoch >> 10, title, body,
//         platformChannelSpecifics,
//         payload: 'item x');
//   }
// }

// var notification = Notification();
