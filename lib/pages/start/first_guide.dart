import 'package:flutter/material.dart';
import 'package:proflu/common/global/global.dart';
import 'package:proflu/common/values/values.dart';
import 'package:proflu/common/widget/widgets.dart';

import '../../common/utils/utils.dart';

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
          left: 0.w,
          right: 0.w,
          bottom: 0.1.sh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buidIndefot(0),
              buidIndefot(1),
              buidIndefot(2),
            ],
          ),
        ),
        // 去首页
        Positioned(
          left: 0.w,
          right: 0.w,
          bottom: 0.2.sh,
          child: buildGoHome(),
        ),
      ],
    );
  }

  Widget buildGoHome() {
    if (_currIndex != 2) return Container();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          height: 130.w,
          width: 622.w,
          duration: const Duration(milliseconds: 0),
          child: ElevatedButton(
            child: PFtext.text1(text: "立即开启", color: Colors.white),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(PFc.themeColor)),
            onPressed: () {
              Storage.setInt('isFirstOpen', Global.isFirstOpen);

              Navigator.of(context).pushReplacementNamed('/signinpage');
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
          Image.asset(
            'assets/images/GuidePage1.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/GuidePage2.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/GuidePage3.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          // Image.network(
          //   'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
          //   width: width,
          //   height: height,
          //   fit: BoxFit.fill,
        ],
      ),
    );
  }

  // 小圆点
  Widget buidIndefot(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(15),
      height: 18,
      width: _currIndex == index ? 25 : 18,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: index <= _currIndex ? PFc.themeColor : Color(0xffC4C4C4),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
