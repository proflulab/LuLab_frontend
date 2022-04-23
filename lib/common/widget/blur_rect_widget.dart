import 'dart:ui';

import 'package:flutter/material.dart';

class BlurRectWidget extends StatelessWidget {
  final Widget child;
  final double padding;

  const BlurRectWidget({Key? key, required this.child, this.padding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          color: Colors.white10,
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
