import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Timer"),
            ),
            body: const Center(
              child: MyHomePage(),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;

  //倒计时数值
  var _enable = true;
  var _time = 0;

  //倒计时方法
  void startCountdown(int count) {
    if (!_enable) return;
    setState(() {
      _enable = false;
      _time = count;
    });
    //倒计时时间
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer it) {
      if (kDebugMode) {
        print(it.tick);
      }
      setState(() {
        if (it.tick == count) {
          _enable = true;
          it.cancel();
        }
        _time = count - it.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // ignore: unnecessary_statements
            _enable ? startCountdown(60) : null;
          },
          child: Text(
            _time == 0 ? "获取验证码" : "${_time}s后重新获取",
            style: const TextStyle(fontSize: 25, color: Colors.blueAccent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _time = 0;
                      _enable = true;
                      if (_timer.isActive) {
                        _timer.cancel();
                      }
                    });
                  },
                  child: const Text(
                    "结束",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
