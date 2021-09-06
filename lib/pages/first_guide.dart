import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstGuidePage extends StatelessWidget {
  const FirstGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstGuide(),
    );
  }
}

class FirstGuide extends StatefulWidget {
  FirstGuide({Key? key}) : super(key: key);

  @override
  _FirstGuideState createState() => _FirstGuideState();
}

class _FirstGuideState extends State<FirstGuide> {
  int _currIndex = 0;

  _guideData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('Key_Int', 1);
  }

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
          duration: Duration(milliseconds: 0),
          child: ElevatedButton(
            child: Text('立即体验'),
            onPressed: () {
              _guideData();
              Navigator.of(context).pushReplacementNamed('/app');
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
            'https://news.wjdaily.com/attaches/image/320598/20171219/151365265686382.jpg',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.network(
            'http://n4-q.mafengwo.net/s5/M00/DC/7E/wKgB3FGLd6yAOv6fAAFa2fIseJI42.jpeg?imageMogr2%2Fthumbnail%2F%21690x370r%2Fgravity%2FCenter%2Fcrop%2F%21690x370%2Fquality%2F100',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://dimg06.c-ctrip.com/images/350f0r000000hbtusABBD_C_500_280_Q60.jpg',
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
      margin: EdgeInsets.only(left: 50),
      height: 18,
      width: isSelected ? 24 : 18,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
