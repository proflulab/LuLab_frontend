import 'package:flutter/material.dart';
import '../values/values.dart';
import '../utils/utils.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 100,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 40,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Color.fromRGBO(81, 207, 108, 1),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: fitFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return Container(
    width: fitWidth(width),
    height: fitHeight(height),
    child: TextButton(
      onPressed: onPressed,
      child: Image.asset(
        "assets/images/$iconFileName.png",
      ),
    ),
  );
}
