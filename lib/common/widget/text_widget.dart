import 'package:flutter/material.dart';

import '../../common/widget/widgets.dart';

import '../../common/values/values.dart';

//实验室个性化字体
Widget text({
  required BuildContext context,
  required String text,
  int maxLines = 2,
  TextOverflow overflow = TextOverflow.ellipsis,
  bool softWrap = false,
  String font = 'MyFontStyle',
  Color? color = PFc.textPrimary,
  double? fontSize,
  FontWeight? fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    textAlign: TextAlign.left,
    //textDirection: TextDirection.rtl,
    softWrap: softWrap,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontFamily: font,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
