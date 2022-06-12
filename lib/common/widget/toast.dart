import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/values/values.dart';
import '../../common/utils/utils.dart';

Future<bool?> toastInfo({
  required String msg,
  Color backgroundColor = PFc.backgroundBlack,
  Color textColor = Colors.white,
}) async {
  PFVibrate.feedback(Type.light);
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: fitFontSize(25),
  );
}
