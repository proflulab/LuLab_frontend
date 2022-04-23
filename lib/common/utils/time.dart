import 'package:date_format/date_format.dart';

class PFTime {
  static client(var stamp, String value) {
    var time = DateTime.now();
    if (stamp is int) {
      time = DateTime.fromMillisecondsSinceEpoch(stamp);
    } else if (stamp is String) {
      var a = int.parse(stamp);
      time = DateTime.fromMillisecondsSinceEpoch(a);
    }

    if (value == "y") {
      return formatDate(time, [yyyy]);
    } else if (value == "m") {
      return formatDate(time, [mm]);
    } else if (value == "d") {
      return formatDate(time, [dd]);
    } else if (value == "h") {
      return formatDate(time, [hh]);
    } else if (value == "n") {
      return formatDate(time, [nn]);
    } else if (value == "s") {
      return formatDate(time, [ss]);
    } else if (value == "ymd") {
      return formatDate(time, [yyyy, '年', mm, '月', dd, '日']);
    } else if (value == "md") {
      return formatDate(time, [mm, '月', dd, '日']);
    } else if (value == "ym") {
      return formatDate(time, [yyyy, '年', mm, '月']);
    } else if (value == "ym.") {
      return formatDate(time, [yyyy, ".", mm]);
    }
  }

  static diff(var start, var end) {
    timed(var v) {
      if (v is int) {
        return DateTime.fromMillisecondsSinceEpoch(v);
      } else if (v is String) {
        var a = int.parse(v);
        return DateTime.fromMillisecondsSinceEpoch(a);
      }
    }

    var y = timed(end)!.year - timed(start)!.year;
    var m = timed(end)!.month - timed(start)!.month;

    if (m < 0) {
      return "(${y - 1}年${12 + m}个月)";
    } else if (m == 0) {
      return "($y年)";
    } else {
      return "($y年$m个月)";
    }
  }
}
