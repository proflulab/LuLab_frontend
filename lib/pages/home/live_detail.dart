import 'dart:async';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:alarm_calendar/alarm_calendar.dart';
import 'package:alarm_calendar/calendars.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';

class LiveDetail extends StatefulWidget {
  const LiveDetail({Key? key, required this.product}) : super(key: key);
  final LatestDirectCourseElement product;
  @override
  _LiveDetailState createState() => _LiveDetailState();
}

class _LiveDetailState extends State<LiveDetail> {
  late Timer _timer;
  late int seconds;
  DateTime now = DateTime.now();
  //late RecordAdd _recordAdd;
  //late RecordAddClass _recordData;
  late var stauts = widget.product.status;
  late LatestUserCourseRecord _latestUserCourseRecord;
  late String state = "1";

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    super.initState();
    //查询预约情况
    _handleCourseRecord();
    //获取当期时间
    var now = DateTime.now();
    var now2 = widget.product.onlineTime;
    var future = DateTime.fromMillisecondsSinceEpoch(now2);
    // print(formatDate(now, [yyyy, '年', mm, '月', dd, ' ', HH, ':', nn, ':', ss]));
    var nowYear = int.parse(formatDate(now, [yyyy]));
    var nowMounth = int.parse(formatDate(now, [mm]));
    var nowDay = int.parse(formatDate(now, [dd]));
    var nowHour = int.parse(formatDate(now, [HH]));
    var nowMinute = int.parse(formatDate(now, [nn]));
    var nowSecond = int.parse(formatDate(now, [ss]));
    var futureYear = int.parse(formatDate(future, [yyyy]));
    var futureMounth = int.parse(formatDate(future, [mm]));
    var futureDay = int.parse(formatDate(future, [dd]));
    var futureHour = int.parse(formatDate(future, [HH]));
    var futureMinute = int.parse(formatDate(future, [nn]));
    var futureSecond = int.parse(formatDate(future, [ss]));
    var startDate =
        DateTime(nowYear, nowMounth, nowDay, nowHour, nowMinute, nowSecond);
    var endDate = DateTime(futureYear, futureMounth, futureDay, futureHour,
        futureMinute, futureSecond);
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
    var futureYear = int.parse(formatDate(future, [yyyy]));
    var futureMounth = int.parse(formatDate(future, [mm]));
    var futureDay = int.parse(formatDate(future, [dd]));
    var futureHour = int.parse(formatDate(future, [HH]));
    var futureMinute = int.parse(formatDate(future, [nn]));
    return Event(
      title: widget.product.title,
      description: widget.product.description,
      // location: 'Flutter app',
      startDate: DateTime(
          futureYear, futureMounth, futureDay, futureHour, futureMinute),
      endDate: DateTime(
              futureYear, futureMounth, futureDay, futureHour, futureMinute)
          .add(Duration(minutes: widget.product.duration)),
      allDay: false,
      iosParams: IOSParams(
        reminder: Duration(minutes: widget.product.duration),
      ),
      androidParams: const AndroidParams(
        emailInvites: ["test@example.com"],
      ),
      recurrence: recurrence,
    );
  }

  //查询课程预约情况
  _handleCourseRecord() async {
    LatestUserCourseRecordRequest variables = LatestUserCourseRecordRequest(
      courseId: widget.product.id,
      authorId: Global.profile.id,
    );
    _latestUserCourseRecord = await GqlCourseAPI.orderCourseInfo(
        variables: variables, context: context);
    setState(() {
      state = _latestUserCourseRecord.latestUserCourseRecord.status;
    });
  }

  void _onShare(BuildContext context, String text) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(text,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  Future<void> createEvent(Calendars calendars) async {
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then((res) async {
      if (res != null) {
        //查询是否有写权限
        await AlarmCalendar.CheckWritePermission().then((resWrite) async {
          if (resWrite != null) {
            final id = await AlarmCalendar.createEvent(calendars);
            calendars.setEventId = id!;
            if (kDebugMode) {
              print('获得ID为：' + id);
            }
          }
        });
      }
    });
  }

  //添加预约
  _handleRecordAdd() async {
    RecordAddRequest variables = RecordAddRequest(
      authorId: Global.profile.id,
      status: "1",
      courseId: widget.product.id,
      onlineTime: now,
    );
    //_recordAdd =
    await GqlHomeAPI.recordAddInfo(variables: variables, context: context);
    //var recordData = _recordAdd.recordAdd;
    toastInfo(msg: '预约成功');
    // setState(() {
    //   _recordData = recordData;
    // });
  }

  @override
  Widget build(BuildContext context) {
    var height = (widget.product.description.length / 21) * 32.h;
    var time = DateTime.fromMillisecondsSinceEpoch(widget.product.onlineTime);
    String time1 = formatDate(time, [yyyy, '年', mm, '月', dd, '日']);

    String text = Global.profile.name +
        "邀请您在" +
        time1 +
        "参加" +
        widget.product.title +
        "，主讲人：" +
        widget.product.author;
    var now2 = widget.product.onlineTime;
    var future = DateTime.fromMillisecondsSinceEpoch(now2);
    var futureYear = int.parse(formatDate(future, [yyyy]));
    var futureMounth = int.parse(formatDate(future, [mm]));
    var futureDay = int.parse(formatDate(future, [dd]));
    var futureHour = int.parse(formatDate(future, [HH]));
    var futureMinute = int.parse(formatDate(future, [nn]));
    Calendars calendars = Calendars(
      DateTime(futureYear, futureMounth, futureDay, futureHour, futureMinute),
      DateTime(futureYear, futureMounth, futureDay, futureHour, futureMinute)
          .add(Duration(minutes: widget.product.duration)),
      widget.product.title,
      widget.product.description,
    );
    return Scaffold(
        backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
        body: ListView(
          // scrollDirection: Axis.vertical, //纵向滚动
          children: <Widget>[
            SizedBox(
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "详情",
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'MyFontStyle',
                        fontSize: 20),
                  ),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              decoration: const BoxDecoration(
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
                    top: 30.0.h,
                    left: 50.0.w,
                    child: SizedBox(
                      width: 800.0.w, //容器的相关参数
                      height: 200.0.h,
                      // color: Colors.green,
                      child: Text(
                        "距离" + time1 + "直播开始还有",
                        style: const TextStyle(
                            fontFamily: 'MyFontStyle', fontSize: 18),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80.0.h,
                    left: 25.0.w,
                    child: SizedBox(
                      width: 800.0.w, //容器的相关参数
                      height: 200.0.h,
                      // color: Colors.green,
                      child: constructTime(seconds),
                    ),
                  ),
                  Positioned(
                    top: 185.0.h,
                    left: 50.w,
                    child: SizedBox(
                      width: 270.0.w, //容器的相关参数
                      height: 70.0.h,
                      child: ElevatedButton(
                        child: const Text("邀请好友一起看"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.lightGreen), //背景颜色
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white), //字体颜色
                          overlayColor: MaterialStateProperty.all(
                              const Color(0xffFFF8E5)), // 高亮色
                          shadowColor: MaterialStateProperty.all(
                              const Color(0xffffffff)), //阴影颜色
                          elevation: MaterialStateProperty.all(0), //阴影值
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              fontSize: 13,
                              fontFamily: 'MyFontStyle',
                            ),
                          ), //字体
                          shape: MaterialStateProperty.all(const StadiumBorder(
                              side: BorderSide(
                            //设置 界面效果
                            style: BorderStyle.solid,
                            color: Colors.lightGreen,
                          ))), //圆角弧度
                        ),
                        onPressed: () {
                          _onShare(context, text);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 185.0.h,
                    left: 370.w,
                    child: SizedBox(
                      width: 270.0.w, //容器的相关参数
                      height: 70.0.h,
                      child: ElevatedButton(
                        child: state == "-1"
                            ? const Text("预约")
                            : const Text("已预约"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              state == "-1"
                                  ? Colors.green
                                  : Colors.grey), //背景颜色
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white), //字体颜色
                          overlayColor: MaterialStateProperty.all(
                              const Color(0xffFFF8E5)), // 高亮色
                          shadowColor: MaterialStateProperty.all(
                              const Color(0xffffffff)), //阴影颜色
                          elevation: MaterialStateProperty.all(0), //阴影值
                          textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 13,
                            fontFamily: 'MyFontStyle',
                          )), //字体
                          shape: MaterialStateProperty.all(StadiumBorder(
                              side: BorderSide(
                            //设置 界面效果
                            style: BorderStyle.solid,
                            color: state == "-1" ? Colors.green : Colors.grey,
                          ))), //圆角弧度
                        ),
                        onPressed: () {
                          //执行日历预约方法
                          createEvent(calendars);
                          //执行预约方法
                          setState(() {
                            _handleRecordAdd();
                            state = "0";
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              decoration: const BoxDecoration(
                //设置四周圆角 角度
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 150.h + height,
              width: 690.w,
              // color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20.0.h,
                    left: 45.0.w,
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
                    top: 70.0.h,
                    left: 45.0.w,
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
                    top: 110.0.h,
                    left: 45.0.w,
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
                    top: 150.0.h,
                    left: 40.0.w,
                    child: SizedBox(
                      width: 634.0.w, //容器的相关参数
                      height: height,
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
    const period = Duration(seconds: 1);
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
    _timer.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}
