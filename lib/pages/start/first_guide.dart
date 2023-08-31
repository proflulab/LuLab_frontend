import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/pages/sign_in/login_phone.dart';

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
    return Stack(
      children: [
        buildFirstGuideBackGround(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height), // 背景图
        Positioned(
          left: 0,
          right: 0,
          bottom: 100, // 调整按钮位置，可以根据实际需求调整
          child: buildGoHome(), // 去首页按钮
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: buildIndicators(), // 小圆点指示器
        ),
      ],
    );
  }

  Widget buildFirstGuideBackGround(double width, double height) {
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

  Widget buildGoHome() {
    if (_currIndex != 2) return Container();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          width: 0.7.sw,
          height: cycle(0.5.sw, PFr.golden, 3),
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

                    Get.offAll(const PhoneLogin());
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

  Widget buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIndicator(0),
        SizedBox(width: 8),
        buildIndicator(1),
        SizedBox(width: 8),
        buildIndicator(2),
      ],
    );
  }

  Widget buildIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: _currIndex == index ? 16 : 8, // 小圆点宽度
      height: 8, // 小圆点高度
      decoration: BoxDecoration(
        color: _currIndex == index ? Colors.green : Colors.grey, // 小圆点颜色
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// 示例：HomePage页面
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Welcome to Home Page!"),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: FirstGuidePage(),
  ));
}
