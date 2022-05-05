import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:pinput/pinput.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/values/values.dart';

class Verification extends StatefulWidget { 
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String data = Get.arguments;
  final controller = TextEditingController();
  final focusNode = FocusNode();

  late Timer _timer;

  //倒计时数值
  var _enable = true;
  var _time = 0;

  @override
  void initState() {
    super.initState();
    _enable ? startCountdown(60) : null;
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 2 * PFspace.screenMargin, vertical: 0),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            Row(children: const [Text("输入验证码")]),
            SizedBox(height: 30.h),
            Row(children: [
              Text(data.substring(0, 4) +
                  "****" +
                  data.substring(data.length - 4))
            ]),
            SizedBox(height: 30.h),
            Center(
              child: Pinput(
                length: 6,
                controller: controller,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                separator: const SizedBox(width: 16),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                        offset: Offset(0, 3),
                        blurRadius: 16,
                      )
                    ],
                  ),
                ),
                showCursor: true,
                cursor: cursor,
              ),
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap: () {
                _enable ? startCountdown(60) : null;
              },
              child: Text(
                _time == 0 ? "重新获取" : "重新获取（${_time}s）",
                style: const TextStyle(fontSize: 25, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 0.11.sw,
    height: 0.14.sw,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(232, 235, 241, 0.37),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
