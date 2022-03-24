//import 'dart:ui';

import 'package:flutter/material.dart';
import '../../common/values/values.dart';
//import '../../common/utils/screen.dart';

Widget tagImage({
  required BuildContext context,
  required String url,
  required String tag,
  double height = 160,
  double width = 160,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(url),
        fit: BoxFit.cover,
      ),
      color: const Color.fromRGBO(200, 233, 233, 1),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Stack(
      children: <Widget>[
        // FadeInImage(
        //   placeholder: AssetImage('assets/images/微信.png'),
        //   image: NetworkImage(url),
        // ),
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
            // ClipRRect(
            //   borderRadius: const BorderRadius.only(
            //     topLeft: Radius.circular(10),
            //     topRight: Radius.circular(0),
            //     bottomLeft: Radius.circular(0),
            //     bottomRight: Radius.circular(10),
            //   ),
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            //     child: Center(
            //         child: Text(
            //       tag,
            //       style: const TextStyle(
            //         fontFamily: 'MyFontStyle',
            //         color: Colors.black,
            //         fontSize: 14,
            //       ),
            //     )),
            //   ),
            // ),
          ),
        )
      ],
    ),
  );
}
