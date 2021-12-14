import 'package:flutter/material.dart';
import '../utils/utils.dart';

Widget positionedImage({
  required BuildContext context,
  required String url,
  double top = 10,
  double left = 10,
  double height = 100,
  double width = 100,
}) {
  return Positioned(
    top: top.h,
    left: left.w,
    child: Container(
      height: height.h,
      width: width.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.network(
          url,
        ),
      ),
    ),
  );
}

Widget positionedText({
  required BuildContext context,
  required String text,
  double top = 10,
  double left = 10,
  double height = 100,
  double width = 100,
}) {
  return Positioned(
    top: top.h,
    left: left.w,
    child: Container(
      height: height.h,
      width: width.w,
      child: Text(
        text,
        textAlign: TextAlign.left,
        textDirection: TextDirection.rtl,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
  );
}
