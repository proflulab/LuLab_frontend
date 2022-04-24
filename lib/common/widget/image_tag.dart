import 'package:flutter/material.dart';

import '../../common/widget/widgets.dart';
import '../../common/values/values.dart';
//import '../../common/utils/screen.dart';

Widget tagImage({
  required BuildContext context,
  required String url,
  required String tag,
  double height = 160,
  double width = 160,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedImage.typeLaod(url),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: width * (1 - PFr.platinum) * PFr.silver414,
            width: width * (1 - PFr.platinum),
            child: Center(
              child: Text(
                tag.substring(0, 3),
                style: const TextStyle(
                  //fontFamily: 'MyFontStyle',
                  color: PFc.textWhite,
                  fontSize: 14,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(151, 151, 151, 0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
