import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';

class Agreement extends StatelessWidget {
  const Agreement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            data.values.toList()[1],
            style:
                const TextStyle(fontFamily: 'MyFontStyle', color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        child: Stack(
          children: <Widget>[
            Center(
              child: BackdropFilter(
                //背景滤镜器
                filter: ImageFilter.blur(sigmaX: 0.5), //图片模糊过滤，横向竖向都设置5.0
                child: Opacity(
                  opacity: 0.05,
                  child: SvgPicture.asset("assets/images/logo.svg"),
                ),
              ),
            ),
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: ListView(
                children: [
                  PFMarkdown(data: data.values.toList()[0]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
