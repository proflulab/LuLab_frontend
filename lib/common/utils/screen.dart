import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
    ScreenUtil().setWidth(540)  (sdk>=2.6 : 540.w)   //根据屏幕宽度适配尺寸
    ScreenUtil().setHeight(200) (sdk>=2.6 : 200.h)   //根据屏幕高度适配尺寸(一般根据宽度适配即可)
    ScreenUtil().radius(200)    (sdk>=2.6 : 200.r)   //根据宽度或高度中的较小者进行调整
    ScreenUtil().setSp(24)      (sdk>=2.6 : 24.sp)   //适配字体
    12.sm   // 取12和12.sp中的最小值

    ScreenUtil.pixelRatio       //设备的像素密度
    ScreenUtil.screenWidth   (sdk>=2.6 : 1.sw)   //设备宽度
    ScreenUtil.screenHeight  (sdk>=2.6 : 1.sh)   //设备高度
    ScreenUtil.bottomBarHeight  //底部安全区距离，适用于全面屏下面有按键的
    ScreenUtil.statusBarHeight  //状态栏高度 刘海屏会更高
    ScreenUtil.textScaleFactor //系统字体缩放比例

    ScreenUtil().scaleWidth  // 实际宽度设计稿宽度的比例
    ScreenUtil().scaleHeight // 实际高度与设计稿高度度的比例

    ScreenUtil().orientation  //屏幕方向

    0.2.sw  //屏幕宽度的0.2倍
    0.5.sh  //屏幕高度的50%
*/

//设置宽度
double fitWidth(double width) {
  return ScreenUtil().setWidth(width);
}

//设置宽度
double fitHeight(double height) {
  return ScreenUtil().setHeight(height);
}

//设置字体尺寸
double fitFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}

//获取设备的物理宽度
double fitScreenWidth(double fontSize) {
  return ScreenUtil().screenWidth;
}

//获取设备的物理高度
double fitScreenHeight(double fontSize) {
  return ScreenUtil().screenHeight;
}

//获取状态栏高度 刘海屏会更高
double fitScreenBarHeight = ScreenUtil().statusBarHeight;

extension SizeExtension on num {
  //宽度适配
  ///[ScreenUtil.setWidth]
  double get w => ScreenUtil().setWidth(this);
  //高度适配
  ///[ScreenUtil.setHeight]
  double get h => ScreenUtil().setHeight(this);
  //圆角
  ///[ScreenUtil.radius]
  double get r => ScreenUtil().radius(this);
  //适配字体
  ///[ScreenUtil.setSp]
  double get sp => ScreenUtil().setSp(this);

  //屏幕宽度的倍数
  ///Multiple of screen width
  double get sw => ScreenUtil().screenWidth * this;

  //屏幕高度的倍数
  ///Multiple of screen height
  double get sh => ScreenUtil().screenHeight * this;
}
