import 'package:flutter/material.dart';
import '../../common/values/values.dart';

class SizeText {
  static const Text text1 = Text(
    "DateTime.now().toString()",
    textAlign: TextAlign.left,
    softWrap: false,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      color: PFc.textPrimary,
      fontFamily: '',
      fontSize: 23,
      //fontWeight: FontWeight.bold,
    ),
  );
}
