import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:pinput/pinput.dart';

import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/widget/widgets.dart';

import '../app.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  List data = Get.arguments;
  final TextEditingController controller = TextEditingController();
  final FocusNode _pinputfocusNode = FocusNode();

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
    _pinputfocusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  //获取验证码
  void codeGet() async {
    VerificationCodeRes status =
        await DioUserAPI.codeSend(context: context, number: _numbers);
    if (status.status == '0') {
    } else {
      debugPrint("发送失败");
      toastInfo(msg: '获取验证码失败，请用其他方式登录！');
    }
  }

  //校验验证码、登录
  void codeCheck(String code, String mobile) async {
    CodeCheckRes data = await DioUserAPI.codeCheck(
        context: context, data: CodeCheckReq(code: code, mobile: mobile));
    if (data.status == '0') {
      debugPrint("校验无误");
      Global.saveToken(data.token);
      Get.offAll(const App());
    } else {
      debugPrint("校验失败");
      setState(() {
        controller.text = "";
      });
      toastInfo(msg: '验证码错误');
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
    return GestureDetector(
      onTap: () {
        //隐藏键盘
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        //FocusScope.of(context).requestFocus(FocusNode());
        _pinputfocusNode.unfocus();
      },
      child: Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90.h),
              Row(children: [
                PFtext.text2(text: "验证手机号", fontSize: 24),
              ]),
              SizedBox(height: 30.h),
              Text("请输入发送至+" +
                  data[1].toString() +
                  data[0].substring(0, 4) +
                  "****" +
                  data[0].substring(data[0].length - 4) +
                  "的6位验证码，有效期10分钟"),
              SizedBox(height: 60.h),
              Center(
                child: Pinput(
                  length: 6,
                  controller: controller,
                  focusNode: _pinputfocusNode,
                  autofocus: true,
                  showCursor: true,
                  cursor: cursor,
                  separator: Container(
                    height: 2.5,
                    width: 12,
                    decoration: const BoxDecoration(color: PFc.backgroundBlack),
                  ),
                  separatorPositions: const [3],
                  // errorText: 'Error',
                  // validator: (pin) {
                  //   if (pin == '222222') return null;
                  //   return 'Pin is incorrect';
                  // },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  defaultPinTheme: defaultPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: PFc.themeColor),
                      boxShadow: const [
                        BoxShadow(
                          color: PFc.themeColor,
                          offset: Offset(0, 3),
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                  onCompleted: (value) {
                    if (kDebugMode) {
                      print("onCompleted的监听：$value");
                    }
                    codeCheck(value, data[0]);
                  },
                ),
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  _enable ? startCountdown(60) : null;
                },
                child: Text(
                  _time == 0 ? "重新获取验证码" : "${_time}s后可重新获取验证码",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    color: _time == 0 ? PFc.themeColor : PFc.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 0.14.sw,
    height: 0.14.sw,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: PFc.backgroundPrimary,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: PFc.textSecondary),
    ),
  );

  final submittedPinTheme = PinTheme(
    width: 0.14.sw,
    height: 0.14.sw,
    textStyle: const TextStyle(color: PFc.textPrimary, fontSize: 23),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: PFc.backgroundPrimary,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: PFc.themeColor),
    ),
  );

  //光标
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
