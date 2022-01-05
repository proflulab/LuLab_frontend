import 'package:flutter/material.dart';

final ThemeData mDefaultTheme = ThemeData(
  //主⾊，决定导航栏颜⾊，所有导航栏的颜色将在这里统一设定
  primaryColor: const Color.fromRGBO(116, 192, 252, 1),
  //背景主体颜色
  scaffoldBackgroundColor: const Color.fromRGBO(246, 246, 246, 1),
  //卡⽚颜⾊
  cardColor: const Color(0xF13975EE),
  //深色还是浅色
  brightness: Brightness.light,
);


    
// Brightness brightness, //深色还是浅色
//   MaterialColor primarySwatch, //主题颜色样本，见下面介绍
//   Color primaryColor, //主色，决定导航栏颜色
//   Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
//   Color cardColor, //卡片颜色
//   Color dividerColor, //分割线颜色
//   ButtonThemeData buttonTheme, //按钮主题
//   Color cursorColor, //输入框光标颜色
//   Color dialogBackgroundColor,//对话框背景颜色
//   String fontFamily, //文字字体
//   TextTheme textTheme,// 字体主题，包括标题、body等文字样式
//   IconThemeData iconTheme, // Icon的默认样式
//   TargetPlatform platform, //指定平台，应用特定平台控件风格
//   ...