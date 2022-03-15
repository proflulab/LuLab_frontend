// // import 'dart:async';
// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:xfspeech/xfspeech.dart';
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   String _platformVersion = 'Unknown';
// //   String transResult = '...';
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     initPlatformState();
// //   }
// //
// //   // Platform messages are asynchronous, so we initialize in an async method.
// //   Future<void> initPlatformState() async {
// //     String platformVersion;
// //     // Platform messages may fail, so we use a try/catch PlatformException.
// //     // We also handle the message potentially returning null.
// //     try {
// //       platformVersion =
// //           await Xfspeech.platformVersion ?? 'Unknown platform version';
// //     } on PlatformException {
// //       platformVersion = 'Failed to get platform version.';
// //     }
// //
// //     // If the widget was removed from the tree while the asynchronous platform
// //     // message was in flight, we want to discard the reply rather than calling
// //     // setState to update our non-existent appearance.
// //     if (!mounted) return;
// //
// //     setState(() {
// //       _platformVersion = platformVersion;
// //     });
// //
// //     Xfspeech().onResult().listen((event) {
// //       print('收到事件');
// //       setState(() {
// //         transResult = event.transResult;
// //         // print(event);
// //         // print(event.resultString);
// //         // print(event.transResult);
// //       });
// //       print(json.decode(event.result));
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Plugin example app'),
// //         ),
// //         body: Column(
// //           children: [
// //             Center(
// //               child: Text('Running on: $_platformVersion\n'),
// //             ),
// //             ElevatedButton(
// //                 onPressed: () async {
// //                   await Xfspeech.init(APP_ID: '552cfd88');
// //                 },
// //                 child: const Text('初始化讯飞')),
// //             ElevatedButton(
// //                 onPressed: () async {
// //                   await Xfspeech.startIvw(APP_ID: '552cfd88');
// //                 },
// //                 child: const Text('开始监听唤醒词')),
// //             ElevatedButton(
// //                 onPressed: () async {
// //                   await Xfspeech.ivwStop();
// //                 },
// //                 child: const Text('停止监听唤醒词')),
// //             ElevatedButton(
// //                 onPressed: () async {
// //                   await Xfspeech.startIat(
// //                       APP_ID: '552cfd88', mEngineType: 'local');
// //                 },
// //                 child: const Text('开始语音听写')),
// //             ElevatedButton(
// //                 onPressed: () async {
// //                   await Xfspeech.iatStop();
// //                 },
// //                 child: const Text('停止语音听写')),
// //             Text('识别结果：' + transResult)
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // // import 'dart:async';
// // //
// // // import 'package:add_2_calendar/add_2_calendar.dart';
// // // import 'package:flutter/material.dart';
// // //
// // // class MyApp extends StatelessWidget {
// // //   final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
// // //       GlobalKey<ScaffoldMessengerState>();
// // //
// // //   Event buildEvent({Recurrence? recurrence}) {
// // //     return Event(
// // //       title: 'Test eventeee',
// // //       description: 'example',
// // //       location: 'Flutter app',
// // //       startDate: DateTime(2022, 5, 2, 12, 34),
// // //       endDate: DateTime.now().add(Duration(minutes: 30)),
// // //       allDay: false,
// // //       iosParams: IOSParams(
// // //         reminder: Duration(minutes: 40),
// // //       ),
// // //       androidParams: AndroidParams(
// // //         emailInvites: ["test@example.com"],
// // //       ),
// // //       recurrence: recurrence,
// // //     );
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       scaffoldMessengerKey: scaffoldMessengerKey,
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: const Text('Add event to calendar example'),
// // //         ),
// // //         body: ListView(
// // //           // mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             ListTile(
// // //               title: Text('Add normal event'),
// // //               trailing: Icon(Icons.calendar_today),
// // //               onTap: () {
// // //                 Add2Calendar.addEvent2Cal(
// // //                   buildEvent(),
// // //                 );
// // //               },
// // //             ),
// // //             Divider(),
// // //             ListTile(
// // //               title: const Text('Add event with recurrence 1'),
// // //               subtitle: const Text("weekly for 3 months"),
// // //               trailing: Icon(Icons.calendar_today),
// // //               onTap: () {
// // //                 Add2Calendar.addEvent2Cal(buildEvent(
// // //                   recurrence: Recurrence(
// // //                     frequency: Frequency.weekly,
// // //                     endDate: DateTime.now().add(Duration(days: 60)),
// // //                   ),
// // //                 ));
// // //               },
// // //             ),
// // //             Divider(),
// // //             ListTile(
// // //               title: const Text('Add event with recurrence 2'),
// // //               subtitle: const Text("every 2 months for 6 times (1 year)"),
// // //               trailing: Icon(Icons.calendar_today),
// // //               onTap: () {
// // //                 Add2Calendar.addEvent2Cal(buildEvent(
// // //                   recurrence: Recurrence(
// // //                     frequency: Frequency.monthly,
// // //                     interval: 2,
// // //                     ocurrences: 6,
// // //                   ),
// // //                 ));
// // //               },
// // //             ),
// // //             Divider(),
// // //             ListTile(
// // //               title: const Text('Add event with recurrence 3'),
// // //               subtitle:
// // //                   const Text("RRULE (android only) every year for 10 years"),
// // //               trailing: Icon(Icons.calendar_today),
// // //               onTap: () {
// // //                 Add2Calendar.addEvent2Cal(buildEvent(
// // //                   recurrence: Recurrence(
// // //                     frequency: Frequency.yearly,
// // //                     rRule: 'FREQ=YEARLY;COUNT=10;WKST=SU',
// // //                   ),
// // //                 ));
// // //               },
// // //             ),
// // //             Divider(),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class Countdown extends StatefulWidget {
// // //   @override
// // //   _CountdownState createState() => _CountdownState();
// // // }
// // //
// // // class _CountdownState extends State<Countdown> {
// // //   late Timer _timer;
// // //   late int seconds;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Center(
// // //       child: Text(constructTime(seconds)),
// // //     );
// // //   }
// // //
// // //   //时间格式化，根据总秒数转换为对应的 hh:mm:ss 格式
// // //   String constructTime(int seconds) {
// // //     int hour = seconds ~/ 3600;
// // //     int minute = seconds % 3600 ~/ 60;
// // //     int second = seconds % 60;
// // //     return formatTime(hour) +
// // //         ":" +
// // //         formatTime(minute) +
// // //         ":" +
// // //         formatTime(second);
// // //   }
// // //
// // //   //数字格式化，将 0~9 的时间转换为 00~09
// // //   String formatTime(int timeNum) {
// // //     return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
// // //   }
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     //获取当期时间
// // //     var now = DateTime.now();
// // //     var now1 = now.millisecondsSinceEpoch;
// // //     //获取 2 分钟的时间间隔
// // //     var twoHours = now.add(Duration(days: 2)).difference(now);
// // //     //获取总秒数，2 分钟为 120 秒
// // //     seconds = twoHours.inSeconds;
// // //     startTimer();
// // //   }
// // //
// // //   void startTimer() {
// // //     //设置 1 秒回调一次
// // //     const period = const Duration(seconds: 1);
// // //     _timer = Timer.periodic(period, (timer) {
// // //       //更新界面
// // //       setState(() {
// // //         //秒数减一，因为一秒回调一次
// // //         seconds--;
// // //       });
// // //       if (seconds == 0) {
// // //         //倒计时秒数为0，取消定时器
// // //         cancelTimer();
// // //       }
// // //     });
// // //   }
// // //
// // //   void cancelTimer() {
// // //     if (_timer != null) {
// // //       _timer.cancel();
// // //     }
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     super.dispose();
// // //     cancelTimer();
// // //   }
// // // }
//
// import 'dart:async';
//
// import 'package:alarm_calendar/alarm_calendar_plugin.dart';
// import 'package:flutter/material.dart';
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Calendars calendars = new Calendars(
//       new DateTime.now(),
//       new DateTime.now().add(new Duration(days: 1)),
//       '测试通知',
//       '测试通知描述',
//       [5],
//       '1',
//       1);
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               MaterialButton(
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 child: new Text('创建日程'),
//                 onPressed: () {
//                   createEvent(calendars);
//                 },
//               ),
//               MaterialButton(
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 child: new Text('获取日程'),
//                 onPressed: () {
//                   selectEvent(calendars.getEventId);
//                 },
//               ),
//               MaterialButton(
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 child: new Text('修改日程'),
//                 onPressed: () async {
//                   calendarsInit();
//                   final id = await AlarmCalendar.updateEvent(calendars);
//                   print("修改日程ID为：$id");
//                   calendars.setEventId = id!;
//                 },
//               ),
//               MaterialButton(
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 child: new Text('删除日程'),
//                 onPressed: () async {
//                   final status =
//                       await AlarmCalendar.deleteEvent(calendars.getEventId);
//                   print("删除状态：$status");
//                   calendars.setEventId = '';
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void calendarsInit() {
//     //更新参数
//     calendars.setTitle = '测试通知修改版';
//     calendars.setAlert = [3, 15];
//     calendars.setStartTime = new DateTime.now();
//     calendars.setEndTime = new DateTime.now().add(new Duration(days: 2));
//     calendars.setAllDay = 0;
//     calendars.setNote = '这里是备注内容';
//   }
//
//   Future<void> createEvent(Calendars calendars) async {
//     //查询是否有读权限。
//     await AlarmCalendar.CheckReadPermission().then((res) async {
//       if (res != null) {
//         //查询是否有写权限
//         await AlarmCalendar.CheckWritePermission().then((resWrite) async {
//           if (resWrite != null) {
//             final id = await AlarmCalendar.createEvent(calendars);
//             calendars.setEventId = id!;
//             print('获得ID为：' + id);
//           }
//         });
//       }
//     });
//   }
//
//   Future<void> selectEvent(String id) async {
//     //查询是否有读权限。
//     await AlarmCalendar.CheckReadPermission().then((res) async {
//       if (res != null) {
//         //查询是否有写权限
//         await AlarmCalendar.CheckWritePermission().then((resWrite) async {
//           if (resWrite != null) {
//             final result = await AlarmCalendar.selectEvent(id);
//             print('获取返回数据：$result');
//           }
//         });
//       }
//     });
//   }
// }
// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

// import 'image_previews.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  String text = 'nihao';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plus Plugin Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Share Plus Plugin Demo'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share text:',
                      hintText: 'Enter some text and/or link to share',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      text = value;
                    }),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share subject:',
                      hintText: 'Enter subject to share (optional)',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      subject = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  // ImagePreviews(imagePaths, onDelete: _onDeleteImage),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add image'),
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile = await ImagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imagePaths.add(pickedFile.path);
                        });
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShare(context),
                        child: const Text('Share'),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }
}
