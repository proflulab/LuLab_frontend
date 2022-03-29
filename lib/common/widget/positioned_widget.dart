import 'package:flutter/material.dart';

import '../../common/widget/widgets.dart';

//import '../utils/utils.dart';
import '../../common/values/values.dart';

//可定位图片
Widget positionedImage({
  required BuildContext context,
  required String url,
  double top = 10,
  double? left,
  double? right,
  double height = 100,
  double width = 100,
  BorderRadius? borderRadius,
}) {
  return Positioned(
    top: top,
    left: left,
    right: right,
    child: SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedImage.typeLaod(url),
      ),
    ),
  );
}

//可定位文本
Widget positioningText({
  required BuildContext context,
  required String text,
  double top = 10,
  double left = 10,
  double height = 100,
  double width = 100,
  int maxLines = 2,
  TextOverflow overflow = TextOverflow.ellipsis,
  bool softWrap = false,
  String font = 'MyFontStyle',
  Color? color = PFc.textPrimary,
  double? fontSize,
  FontWeight? fontWeight = FontWeight.normal,
}) {
  return Positioned(
    top: top,
    left: left,
    child: SizedBox(
      //color: Colors.red,
      height: height,
      width: width,
      child: Text(
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
      ),
    ),
  );
}
