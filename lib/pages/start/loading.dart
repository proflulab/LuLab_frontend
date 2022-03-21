import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../app.dart';

//import '../utils/utils.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<int> readData() async {
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getInt('isFirstOpen');

    return result ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(
        'https://gitee.com/shimingy/imagesbed/raw/master/img/%E5%90%AF%E5%8A%A8%E9%A1%B5.png',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    var _duration = const Duration(seconds: 3);

    if (kDebugMode) {
      print("陆向谦程序启动....");
    }
    //Storage.getInt("Key_Int");
    Future<int> result = readData();
    result.then((guide) {
      if (kDebugMode) {
        print(guide);
      }
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
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => const App()),
    //     (route) => route == null);
    Navigator.of(context).pushReplacementNamed('/app');
  }
}
