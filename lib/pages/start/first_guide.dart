import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/entitys/data_user_login.dart';
import '../../common/global/global.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';

import '../app.dart';

class FirstGuidePage extends StatefulWidget {
  const FirstGuidePage({Key? key}) : super(key: key);

  @override
  _FirstGuidePageState createState() => _FirstGuidePageState();
}

class _FirstGuidePageState extends State<FirstGuidePage> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // 背景图
        buildFirstGuideBackGround(1.sw, 1.sh),
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
          width: 0.7.sw,
          height: cycle(0.7.sw, PFr.golden, 3),
          duration: const Duration(milliseconds: 0),
          child: ElevatedButton(
            child: PFtext.text1(text: "立即开启", color: Colors.white),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(PFc.themeColor)),
            onPressed: () {
              Storage.setBool(storageDeviceAlreadyOpenKey, false);
              Storage.getString(storaTokenKey).then(
                (value) async {
                  // 判断是否是第一次启动app
                  if (value == "0" || value == null) {
                    debugPrint("游客登陆");
                    Global.state = UserState.visitor;
                    Global.profile = Data(name: "游客", id: "0");
                    Get.offAll(const App());
                  } else {
                    debugPrint("10");
                    Global.state = UserState.user;
                    Get.offAll(const App());
                  }
                },
              );
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
        ],
      ),
    );
  }

  // 小圆点
  Widget buidIndefot(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(15),
      height: 18.h,
      width: _currIndex == index ? 25 : 18,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: index <= _currIndex ? PFc.themeColor : const Color(0xffC4C4C4),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
    );
  }
}
