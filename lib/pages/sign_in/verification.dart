import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:pinput/pinput.dart';
import 'package:lab/common/utils/utils.dart';
import 'package:lab/common/values/values.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/data_user_login.dart';
import '../../common/global/global.dart';

import '../app.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  List data = Get.arguments;
  final TextEditingController controller = TextEditingController();
  final focusNode = FocusNode();

  late Timer _timer;
  late String _numbers;

  //倒计时数值
  var _enable = true;
  var _time = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _numbers = "+${data[1]}-${data[0]}";
    });
    codeGet();
    _enable ? startCountdown(60) : null;
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  //获取验证码
  void codeGet() async {
    VerificationCodeRes status =
        await DioUserAPI.codeSend(context: context, number: _numbers);
    if (status.status == '0') {
    } else {
      print("发送失败");
    }
  }

  //校验验证码、登录
  void codeCheck(String code, String mobile) async {
    CodeCheckRes data = await DioUserAPI.codeCheck(
        context: context, data: CodeCheckReq(code: code, mobile: mobile));
    if (data.status == '0') {
      print("校验无误");
      Global.saveToken(data.token);
      Get.offAll(const App());
    }
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
              Text(data[0].substring(0, 4) +
                  "****" +
                  data[0].substring(data[0].length - 4))
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
                        color: Color.fromRGBO(0, 0, 0, 0.0618),
                        offset: Offset(0, 3),
                        blurRadius: 16,
                      )
                    ],
                  ),
                ),
                onChanged: (value) {
                  print("onChanged的监听方法：$value");
                  if (value.length >= 6) {
                    codeCheck(value, data[0]);
                  }
                },
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
                _time == 0 ? "重新获取" : "${_time}s后可重新获取验证码",
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
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: PFc.themeColor),
    ),
  );

  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: PFc.themeColor,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
