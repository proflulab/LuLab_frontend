import 'package:flutter/material.dart';
import '../../values/values.dart';

/// 透明背景 AppBar
Widget transparentAppBar({
  required BuildContext context,
  required Widget title,
  required Widget leading,
  required List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: 10,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
