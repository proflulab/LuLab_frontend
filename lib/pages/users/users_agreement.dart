import 'dart:ui';

import '../../common/utils/utils.dart';
//import '../../common/staticdata/staticdata.dart';
import '../../common/widget/widgets.dart';

import 'package:flutter/material.dart';

class Agreement extends StatelessWidget {
  final String data;
  final String title;
  const Agreement({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style:
                const TextStyle(fontFamily: 'MyFontStyle', color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {},
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
                  child: Image.asset('assets/images/OIP-TY.jpg',
                      fit: BoxFit.contain),
                ),
              ),
            ),
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: ListView(
                children: [
                  // PFMarkdown(data: Markdowndata.agreementUser),
                  PFMarkdown(data: data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
