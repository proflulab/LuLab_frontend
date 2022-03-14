import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xfspeech/xfspeech.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String transResult = '...';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await Xfspeech.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

    Xfspeech().onResult().listen((event) {
      if (kDebugMode) {
        print('收到事件');
      }
      setState(() {
        transResult = event.transResult;
        // print(event);
        // print(event.resultString);
        // print(event.transResult);
      });
      if (kDebugMode) {
        print(json.decode(event.result));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await Xfspeech.init(APP_ID: '552cfd88');
                },
                child: const Text('初始化讯飞')),
            ElevatedButton(
                onPressed: () async {
                  await Xfspeech.startIvw(APP_ID: '552cfd88');
                },
                child: const Text('开始监听唤醒词')),
            ElevatedButton(
                onPressed: () async {
                  await Xfspeech.ivwStop();
                },
                child: const Text('停止监听唤醒词')),
            ElevatedButton(
                onPressed: () async {
                  await Xfspeech.startIat(
                      APP_ID: '552cfd88', mEngineType: 'local');
                },
                child: const Text('开始语音听写')),
            ElevatedButton(
                onPressed: () async {
                  await Xfspeech.iatStop();
                },
                child: const Text('停止语音听写')),
            Text('识别结果：' + transResult)
          ],
        ),
      ),
    );
  }
}
// import 'dart:async';
//
// import 'package:add_2_calendar/add_2_calendar.dart';
// import 'package:flutter/material.dart';
//
// class MyApp extends StatelessWidget {
//   final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
//       GlobalKey<ScaffoldMessengerState>();
//
//   Event buildEvent({Recurrence? recurrence}) {
//     return Event(
//       title: 'Test eventeee',
//       description: 'example',
//       location: 'Flutter app',
//       startDate: DateTime(2022, 5, 2, 12, 34),
//       endDate: DateTime.now().add(Duration(minutes: 30)),
//       allDay: false,
//       iosParams: IOSParams(
//         reminder: Duration(minutes: 40),
//       ),
//       androidParams: AndroidParams(
//         emailInvites: ["test@example.com"],
//       ),
//       recurrence: recurrence,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       scaffoldMessengerKey: scaffoldMessengerKey,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Add event to calendar example'),
//         ),
//         body: ListView(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ListTile(
//               title: Text('Add normal event'),
//               trailing: Icon(Icons.calendar_today),
//               onTap: () {
//                 Add2Calendar.addEvent2Cal(
//                   buildEvent(),
//                 );
//               },
//             ),
//             Divider(),
//             ListTile(
//               title: const Text('Add event with recurrence 1'),
//               subtitle: const Text("weekly for 3 months"),
//               trailing: Icon(Icons.calendar_today),
//               onTap: () {
//                 Add2Calendar.addEvent2Cal(buildEvent(
//                   recurrence: Recurrence(
//                     frequency: Frequency.weekly,
//                     endDate: DateTime.now().add(Duration(days: 60)),
//                   ),
//                 ));
//               },
//             ),
//             Divider(),
//             ListTile(
//               title: const Text('Add event with recurrence 2'),
//               subtitle: const Text("every 2 months for 6 times (1 year)"),
//               trailing: Icon(Icons.calendar_today),
//               onTap: () {
//                 Add2Calendar.addEvent2Cal(buildEvent(
//                   recurrence: Recurrence(
//                     frequency: Frequency.monthly,
//                     interval: 2,
//                     ocurrences: 6,
//                   ),
//                 ));
//               },
//             ),
//             Divider(),
//             ListTile(
//               title: const Text('Add event with recurrence 3'),
//               subtitle:
//                   const Text("RRULE (android only) every year for 10 years"),
//               trailing: Icon(Icons.calendar_today),
//               onTap: () {
//                 Add2Calendar.addEvent2Cal(buildEvent(
//                   recurrence: Recurrence(
//                     frequency: Frequency.yearly,
//                     rRule: 'FREQ=YEARLY;COUNT=10;WKST=SU',
//                   ),
//                 ));
//               },
//             ),
//             Divider(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Countdown extends StatefulWidget {
//   @override
//   _CountdownState createState() => _CountdownState();
// }
//
// class _CountdownState extends State<Countdown> {
//   late Timer _timer;
//   late int seconds;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(constructTime(seconds)),
//     );
//   }
//
//   //时间格式化，根据总秒数转换为对应的 hh:mm:ss 格式
//   String constructTime(int seconds) {
//     int hour = seconds ~/ 3600;
//     int minute = seconds % 3600 ~/ 60;
//     int second = seconds % 60;
//     return formatTime(hour) +
//         ":" +
//         formatTime(minute) +
//         ":" +
//         formatTime(second);
//   }
//
//   //数字格式化，将 0~9 的时间转换为 00~09
//   String formatTime(int timeNum) {
//     return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     //获取当期时间
//     var now = DateTime.now();
//     var now1 = now.millisecondsSinceEpoch;
//     //获取 2 分钟的时间间隔
//     var twoHours = now.add(Duration(days: 2)).difference(now);
//     //获取总秒数，2 分钟为 120 秒
//     seconds = twoHours.inSeconds;
//     startTimer();
//   }
//
//   void startTimer() {
//     //设置 1 秒回调一次
//     const period = const Duration(seconds: 1);
//     _timer = Timer.periodic(period, (timer) {
//       //更新界面
//       setState(() {
//         //秒数减一，因为一秒回调一次
//         seconds--;
//       });
//       if (seconds == 0) {
//         //倒计时秒数为0，取消定时器
//         cancelTimer();
//       }
//     });
//   }
//
//   void cancelTimer() {
//     if (_timer != null) {
//       _timer.cancel();
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     cancelTimer();
//   }
// }
