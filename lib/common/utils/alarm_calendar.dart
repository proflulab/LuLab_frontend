import 'package:alarm_calendar/alarm_calendar_plugin.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';

class Calendar {
  //创建日程
  static Future<void> createEvent(
    String title,
    String note,
    DateTime time,
    int duration,
  ) async {
    final Calendars calendars = Calendars(
        time, time.add(Duration(minutes: duration)), title, note, [15], '1', 0);
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then(
      (res) async {
        if (res != null) {
          //查询是否有写权限
          await AlarmCalendar.CheckWritePermission().then(
            (resWrite) async {
              if (resWrite != null) {
                final id = await AlarmCalendar.createEvent(calendars);
                calendars.setEventId = id!;
                if (kDebugMode) {
                  print('获得ID为：' + id);
                }
              }
            },
          );
        }
      },
    );
  }

  //获取日程
  static Future<void> selectEvent(String id) async {
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then(
      (res) async {
        if (res != null) {
          //查询是否有写权限
          await AlarmCalendar.CheckWritePermission().then(
            (resWrite) async {
              if (resWrite != null) {
                final result = await AlarmCalendar.selectEvent(id);
                if (kDebugMode) {
                  print('获取返回数据：$result');
                }
              }
            },
          );
        }
      },
    );
  }

  //TODO 此方法未写完！！
  // //修改日程,未写完！！
  // static Future<void> calendarsInit(
  //   setStartTime,
  //   setTitle,
  //   setAlert,
  //   setEndTime,
  //   setAllDay,
  //   setNote,
  // ) async {
  //   final id = await AlarmCalendar.updateEvent(
  //     Calendars(
  //       DateTime.now(),
  //       DateTime.now().add(const Duration(days: 1)),
  //       '测试通知',
  //       '测试通知描述',
  //       [5],
  //       '1',
  //       1,
  //     ),
  //   );
  //   //更新参数
  //   if (kDebugMode) {
  //     print("修改日程ID为：$id");
  //   }
  //   //calendars.setEventId = id!;
  // }

  //删除日程
  static Future<void> calendarDelete(String id) async {
    final status = await AlarmCalendar.deleteEvent(id);
    if (kDebugMode) {
      print("删除状态：$status");
    }
    //calendars.setEventId = '';
  }
}
