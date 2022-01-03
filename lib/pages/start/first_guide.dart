import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class FirstGuidePage extends StatelessWidget {
  const FirstGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FirstGuide(),
    );
  }
}

class FirstGuide extends StatefulWidget {
  const FirstGuide({Key? key}) : super(key: key);

  @override
  _FirstGuideState createState() => _FirstGuideState();
}

class _FirstGuideState extends State<FirstGuide> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // 背景图
        buildFirstGuideBackGround(width, height),
        // 小圆点
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buidIndefot(_currIndex == 0),
              buidIndefot(_currIndex == 1),
              buidIndefot(_currIndex == 2),
            ],
          ),
        ),
        // 去首页
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: buildGoHome(),
        ),
      ],
    );
  }

  Row buildGoHome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          height: _currIndex == 2 ? 50 : 0,
          width: _currIndex == 2 ? 240 : 0,
          duration: const Duration(milliseconds: 0),
          child: ElevatedButton(
            child: const Text('立即体验'),
            onPressed: () {
              Storage.setInt('Key_Int', 1);
              Navigator.of(context).pushReplacementNamed('/login');
            } // 去首页路由
            ,
          ),
        )
      ],
    );
  }

  // 引导页背景图
  Positioned buildFirstGuideBackGround(double width, double height) {
    return Positioned.fill(
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            _currIndex = value;
          });
        },
        children: [
          Image.network(
            'https://gitee.com/shimingy/imagesbed/raw/master/img/引导页1.jpg',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://gitee.com/shimingy/imagesbed/raw/master/img/引导页2.jpg',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://gitee.com/shimingy/imagesbed/raw/master/img/引导页3.jpg',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  // 小圆点
  Widget buidIndefot(bool isSelected) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(left: 50),
      height: 18,
      width: isSelected ? 24 : 18,
      duration: const Duration(milliseconds: 300),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius:  BorderRadius.all(Radius.circular(10))),
    );
  }
}
