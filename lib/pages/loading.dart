import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<int> readData() async {
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getInt('Key_Int');

    return result ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(
        'https://gitee.com/shimingy/imagesbed/raw/master/img/启动页.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    countDown();
  }

  void countDown() {
    var _duration = Duration(seconds: 3);

    print("LuLab程序启动....");
    Future<int> result = readData();
    result.then((guide) {
      print(guide);
      //判断是否是第一次启动app
      if (guide == 0) {
        Future.delayed(_duration, _firstguide);
      } else {
        Future.delayed(_duration, _app);
      }
    });
  }

  void _firstguide() {
    Navigator.of(context).pushReplacementNamed('/firstguide');
  }

  void _app() {
    Navigator.of(context).pushReplacementNamed('/app');
  }
}
