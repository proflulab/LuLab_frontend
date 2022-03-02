import 'package:flutter/material.dart';

import '../utils/utils.dart';

//可定位图片
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
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          color: const Color.fromRGBO(200, 233, 233, 1),
          borderRadius: BorderRadius.circular(10)),
    ),
  );
}

//可定位文本
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
    child: SizedBox(
      height: height.h,
      width: width.w,
      child: Text(
        text,
        textAlign: TextAlign.left,
        //textDirection: TextDirection.rtl,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: 'MyFontStyle',
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ),
  );
}
