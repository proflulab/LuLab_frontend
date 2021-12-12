import 'package:flutter/material.dart';
import '../values/values.dart';
import '../utils/utils.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: duSetFontSize(fontSize),
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
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: TextButton(
      onPressed: onPressed,
      child: Image.asset(
        "assets/images/$iconFileName.png",
      ),
    ),
  );
}
