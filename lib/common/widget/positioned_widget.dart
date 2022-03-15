import 'package:flutter/material.dart';

//import '../utils/utils.dart';
import '../../common/values/values.dart';

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
    top: top,
    left: left,
    child: Container(
      height: height,
      width: width,
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
Widget positioningText({
  required BuildContext context,
  required String text,
  double top = 10,
  double left = 10,
  double height = 100,
  double width = 100,
  int maxLines = 2,
  String font = 'MyFontStyle',
  Color? color = ProfluC.textPrimary,
  double? fontSize = ProfluFS.size17,
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
        textDirection: TextDirection.rtl,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
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
