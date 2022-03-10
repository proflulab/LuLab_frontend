import 'dart:async';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proflu/common/values/radii.dart';

class LiveDetail extends StatefulWidget {
  const LiveDetail({Key? key, required this.product}) : super(key: key);
  final product;
  @override
  _LiveDetailState createState() => _LiveDetailState();
}

class _LiveDetailState extends State<LiveDetail> {
  late Timer _timer;
  late int seconds;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    super.initState();
    //获取当期时间
    var now = DateTime.now();
    var now2 = widget.product.onlineTime;
    var future = DateTime.fromMillisecondsSinceEpoch(now2);
    // print(formatDate(now, [yyyy, '年', mm, '月', dd, ' ', HH, ':', nn, ':', ss]));
    var now_year = int.parse(formatDate(now, [yyyy]));
    var now_mounth = int.parse(formatDate(now, [mm]));
    var now_day = int.parse(formatDate(now, [dd]));
    var now_hour = int.parse(formatDate(now, [HH]));
    var now_minute = int.parse(formatDate(now, [nn]));
    var now_second = int.parse(formatDate(now, [ss]));
    var future_year = int.parse(formatDate(future, [yyyy]));
    var future_mounth = int.parse(formatDate(future, [mm]));
    var future_day = int.parse(formatDate(future, [dd]));
    var future_hour = int.parse(formatDate(future, [HH]));
    var future_minute = int.parse(formatDate(future, [nn]));
    var future_second = int.parse(formatDate(future, [ss]));
    var startDate = new DateTime(
        now_year, now_mounth, now_day, now_hour, now_minute, now_second);
    var endDate = new DateTime(future_year, future_mounth, future_day,
        future_hour, future_minute, future_second);
    var seconds2 = endDate.difference(startDate).inSeconds;
    //获取 2 分钟的时间间隔
    var twoHours = now.add(Duration(seconds: seconds2)).difference(now);
    //获取总秒数，2 分钟为 120 秒
    seconds = twoHours.inSeconds;
    startTimer();
  }

  Event buildEvent({Recurrence? recurrence}) {
    var now2 = widget.product.onlineTime;
    var future = DateTime.fromMillisecondsSinceEpoch(now2);
    var future_year = int.parse(formatDate(future, [yyyy]));
    var future_mounth = int.parse(formatDate(future, [mm]));
    var future_day = int.parse(formatDate(future, [dd]));
    var future_hour = int.parse(formatDate(future, [HH]));
    var future_minute = int.parse(formatDate(future, [nn]));
    return Event(
      title: widget.product.title,
      description: widget.product.description,
      // location: 'Flutter app',
      startDate: DateTime(
          future_year, future_mounth, future_day, future_hour, future_minute),
      endDate: DateTime(future_year, future_mounth, future_day, future_hour,
              future_minute)
          .add(Duration(minutes: widget.product.duration)),
      allDay: false,
      iosParams: IOSParams(
        reminder: Duration(minutes: widget.product.duration),
      ),
      androidParams: AndroidParams(
        emailInvites: ["test@example.com"],
      ),
      recurrence: recurrence,
    );
  }

  @override
  Widget build(BuildContext context) {
    var time = DateTime.fromMillisecondsSinceEpoch(widget.product.onlineTime);
    String time1 = formatDate(time, [yyyy, '年', mm, '月', dd, '日']);
    var stack = Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: 750.0.w, //容器的相关参数
            height: 430.0.h,
            // alignment: Alignment.center, //在容器的位置
            child: Image.network(
              widget.product.imgUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 210.0,
          // right: 10,
          child: Container(
            //从这里开始
            height: 100.h,
            width: 750.w,

            decoration: const BoxDecoration(
//背景
              color: Colors.white,
              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
        ),
        Positioned(
          top: 275.0,
          left: 5,
          child: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
            decoration: BoxDecoration(
              //设置四周圆角 角度
              color: Colors.white,
              borderRadius: Radii.k6pxRadius,
            ),
            height: 237,
            width: 345,
            // color: Colors.white,
          ),
        ),
        // Positioned(
        //   top: 230.0,
        //   left: 20.0,
        //   child: SizedBox(
        //     width: 1000.0.w, //容器的相关参数
        //     height: 80.0.h,
        //     // color: Colors.green,
        //     child: Text(
        //       widget.product.title,
        //       style: const TextStyle(
        //           fontFamily: 'MyFontStyle', color: Colors.black, fontSize: 20),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 270.0,
        //   left: 210.0,
        //   child: SizedBox(
        //     width: 200.0.w, //容器的相关参数
        //     height: 100.0.h,
        //     // color: Colors.green,
        //     child: Text(
        //       widget.product.authorTags,
        //       style: const TextStyle(
        //           fontFamily: 'MyFontStyle', color: Colors.black, fontSize: 18),
        //     ),
        //   ),
        // ),
        Positioned(
          top: 295.0,
          left: 38.0,
          child: SizedBox(
            width: 800.0.w, //容器的相关参数
            height: 200.0.h,
            // color: Colors.green,
            child: Text("距离" + time1 + "直播开始还有",
                style:
                    const TextStyle(fontFamily: 'MyFontStyle', fontSize: 18)),
          ),
        ),

        Positioned(
          top: 320.0,
          left: 30.0,
          child: SizedBox(
            width: 800.0.w, //容器的相关参数
            height: 200.0.h,
            // color: Colors.green,
            child: constructTime(seconds),
          ),
        ),
        Positioned(
          top: 380.0,
          left: 120.0,
          child: SizedBox(
            width: 270.0.w, //容器的相关参数
            height: 70.0.h,
            child: ElevatedButton(
              child: Text("开播提醒"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green), //背景颜色
                foregroundColor: MaterialStateProperty.all(Colors.white), //字体颜色
                overlayColor:
                    MaterialStateProperty.all(Color(0xffFFF8E5)), // 高亮色
                shadowColor:
                    MaterialStateProperty.all(Color(0xffffffff)), //阴影颜色
                elevation: MaterialStateProperty.all(0), //阴影值
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 20,
                  fontFamily: 'MyFontStyle',
                )), //字体
                shape: MaterialStateProperty.all(BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5))), //圆角弧度
              ),
              onPressed: () {
                //执行预约方法
                Add2Calendar.addEvent2Cal(buildEvent(
                  recurrence: Recurrence(
                    frequency: Frequency.weekly,
                    endDate: DateTime.now().add(Duration(days: 60)),
                  ),
                ));
              },
            ),
          ),
        ),
      ],
    );
    return Scaffold(
        backgroundColor: Color.fromRGBO(220, 220, 220, 1),
        body: ListView(
          // scrollDirection: Axis.vertical, //纵向滚动
          children: <Widget>[
            Container(
              width: 750.0.w, //容器的相关参数
              height: 430.0.h,
              // alignment: Alignment.center, //在容器的位置
              child: Image.network(
                widget.product.imgUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                //从这里开始
                height: 100.h,
                width: 750.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text("详情",
                      style: const TextStyle(
                          color: Colors.green,
                          fontFamily: 'MyFontStyle',
                          fontSize: 20)),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              decoration: BoxDecoration(
                //设置四周圆角 角度
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 300.h,
              width: 690.w,
              // color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10.0,
                    left: 38.0,
                    child: SizedBox(
                      width: 800.0.w, //容器的相关参数
                      height: 200.0.h,
                      // color: Colors.green,
                      child: Text("距离" + time1 + "直播开始还有",
                          style: const TextStyle(
                              fontFamily: 'MyFontStyle', fontSize: 18)),
                    ),
                  ),
                  Positioned(
                    top: 43.0,
                    left: 25.0,
                    child: SizedBox(
                      width: 800.0.w, //容器的相关参数
                      height: 200.0.h,
                      // color: Colors.green,
                      child: constructTime(seconds),
                    ),
                  ),
                  Positioned(
                    top: 110.0,
                    left: 105.0,
                    child: SizedBox(
                      width: 270.0.w, //容器的相关参数
                      height: 70.0.h,
                      child: ElevatedButton(
                        child: Text("开播提醒"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green), //背景颜色
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white), //字体颜色
                          overlayColor: MaterialStateProperty.all(
                              Color(0xffFFF8E5)), // 高亮色
                          shadowColor: MaterialStateProperty.all(
                              Color(0xffffffff)), //阴影颜色
                          elevation: MaterialStateProperty.all(0), //阴影值
                          textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 20,
                            fontFamily: 'MyFontStyle',
                          )), //字体
                          shape: MaterialStateProperty.all(
                              BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5))), //圆角弧度
                        ),
                        onPressed: () {
                          //执行预约方法
                          Add2Calendar.addEvent2Cal(buildEvent(
                            recurrence: Recurrence(
                              frequency: Frequency.weekly,
                              endDate: DateTime.now().add(Duration(days: 60)),
                            ),
                          ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              decoration: BoxDecoration(
                //设置四周圆角 角度
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 320.h,
              width: 690.w,
              // color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20.0,
                    left: 15.0,
                    child: SizedBox(
                      width: 690.0.w, //容器的相关参数
                      height: 80.0.h,
                      // color: Colors.green,
                      child: Text(
                        widget.product.title,
                        style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 49.0,
                    left: 18.0,
                    child: SizedBox(
                      width: 690.0.w, //容器的相关参数
                      height: 80.0.h,
                      // color: Colors.green,
                      child: Text(
                        "主讲人：" + widget.product.author,
                        style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 71.0,
                    left: 18.0,
                    child: SizedBox(
                      width: 690.0.w, //容器的相关参数
                      height: 80.0.h,
                      // color: Colors.green,
                      child: Text(
                        time1,
                        style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 104.0,
                    left: 15.0,
                    child: SizedBox(
                      width: 634.0.w, //容器的相关参数
                      height: 240.0.h,
                      child: Text(
                        widget.product.description,
                        style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   width: 375.0.w,
            //   height: 1000.0.h,
            //   color: Color.fromRGBO(190, 190, 190, 1),
            //   child: stack,
            // ),
          ],
        ));
  }

  //时间格式化，根据总秒数转换为对应的 hh:mm:ss 格式
  Text constructTime(int seconds) {
    int day = seconds ~/ 86400;
    int hour = seconds % 86400 ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return Text(
      formatTime(day) +
          "天" +
          formatTime(hour) +
          "小时" +
          formatTime(minute) +
          "分钟" +
          formatTime(second) +
          "秒",
      style: const TextStyle(
          fontFamily: 'MyFontStyle', color: Colors.black, fontSize: 30),
    );
  }

  //数字格式化，将 0~9 的时间转换为 00~09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  void startTimer() {
    //设置 1 秒回调一次
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //更新界面
      setState(() {
        //秒数减一，因为一秒回调一次
        seconds--;
      });
      if (seconds == 0) {
        //倒计时秒数为0，取消定时器
        cancelTimer();
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}
