import 'package:alarm_calendar/alarm_calendar_plugin.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';

class Calendar {
  static final Calendars calendars = Calendars(
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
    '测试通知',
    '测试通知描述',
    [5],
    '1',
    1,
  );

  //获取日程
  static void calendarGet() {
    selectEvent(calendars.getEventId);
  }

  //修改日程
  static Future<void> calendarsInit(
    setTitle,
    setAlert,
    setStartTime,
    setEndTime,
    setAllDay,
    setNote,
  ) async {
    //更新参数
    calendars.setTitle = setTitle;
    calendars.setAlert = setAlert;
    calendars.setStartTime = setStartTime;
    calendars.setEndTime = setEndTime;
    calendars.setAllDay = setAllDay;
    calendars.setNote = setNote;

    final id = await AlarmCalendar.updateEvent(calendars);
    if (kDebugMode) {
      print("修改日程ID为：$id");
    }
    calendars.setEventId = id!;
  }

  //删除日程
  static Future<void> calendarDelete() async {
    final status = await AlarmCalendar.deleteEvent(calendars.getEventId);
    if (kDebugMode) {
      print("删除状态：$status");
    }
    calendars.setEventId = '';
  }

  //创建日程
  static Future<void> createEvent(
    String title,
    String note,
    DateTime time,
    int duration,
  ) async {
    final Calendars calendars = Calendars(
      time,
      time.add(Duration(minutes: duration)),
      title,
      note,
      [15],
      '1',
      0,
    );
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

  static Future<void> selectEvent(String id) async {
    //查询是否有读权限。
    await AlarmCalendar.CheckReadPermission().then(
      (res) async {
        if (res != null) {
          //查询是否有写权限
          await AlarmCalendar.CheckWritePermission().then((resWrite) async {
            if (resWrite != null) {
              final result = await AlarmCalendar.selectEvent(id);
              if (kDebugMode) {
                print('获取返回数据：$result');
              }
            }
          });
        }
      },
    );
  }
}
