import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proflu/common/utils/screen.dart';

Widget TagImage({
  required BuildContext context,
  required String url,
  required String tag,
}) {
  return Container(
    height: 160.h,
    width: 280.w,
    decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        color: const Color.fromRGBO(200, 233, 233, 1),
        borderRadius: BorderRadius.circular(10)),
    child: Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 35.h,
              width: 100.w,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(10),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Center(
                      child: Text(
                    tag,
                    style: TextStyle(
                      fontFamily: 'MyFontStyle',
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                // BorderRadius.only(
                //   topLeft: Radius.circular(10),
                //   topRight: Radius.circular(0),
                //   bottomLeft: Radius.circular(0),
                //   bottomRight: Radius.circular(10),
                // )
              ),
            ))
      ],
    ),
  );
}
