import 'package:flutter/widgets.dart';

//自定义图标
class MyIcon {
  static const String _family = 'MyIcons';
  MyIcon._();
  static const IconData zan = IconData(0xe829, fontFamily: _family);
  static const IconData xiazai = IconData(0xe652, fontFamily: _family);
  static const IconData huiyuan = IconData(0xe61d, fontFamily: _family);
  static const IconData fankui = IconData(0xe62d, fontFamily: _family);
  static const IconData yuyin = IconData(0xe606, fontFamily: _family);
  static const IconData dyvmsyuyinfuwu = IconData(0xe6e8, fontFamily: _family);

  //导航栏icon
  static const IconData navIconHomeSelected =
      IconData(0xe603, fontFamily: _family);
  static const IconData navIconHomeDefault =
      IconData(0xe60b, fontFamily: _family);

  static const IconData navIconCourseSelected =
      IconData(0xe604, fontFamily: _family);
  static const IconData navIconCourseDefault =
      IconData(0xe60c, fontFamily: _family);

  static const IconData navIconFindSelected =
      IconData(0xe605, fontFamily: _family);
  static const IconData navIconFindDefault =
      IconData(0xe60d, fontFamily: _family);

  static const IconData navIconUserSelected =
      IconData(0xe60e, fontFamily: _family);
  static const IconData navIconUserDefault =
      IconData(0xe60a, fontFamily: _family);

  //我的页面icon

  static const IconData userScan = IconData(0xe829, fontFamily: _family);
  static const IconData userSetting = IconData(0xe829, fontFamily: _family);

  static const IconData userBuy = IconData(0xe61b, fontFamily: _family);
  static const IconData userDownload = IconData(0xe61a, fontFamily: _family);
  static const IconData userCollect = IconData(0xe829, fontFamily: _family);
  static const IconData userHistory = IconData(0xe61c, fontFamily: _family);
  static const IconData userVip = IconData(0xe61e, fontFamily: _family);

  static const IconData userRight = IconData(0xe61d, fontFamily: _family);
  static const IconData userPhone = IconData(0xe62a, fontFamily: _family);
  static const IconData userOnline = IconData(0xe622, fontFamily: _family);
  static const IconData userHelp = IconData(0xe629, fontFamily: _family);
  static const IconData userCooperation = IconData(0xe61f, fontFamily: _family);
}
