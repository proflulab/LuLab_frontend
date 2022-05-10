import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/staticdata/staticdata.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

import '../../controller/quick_login_controller.dart';
import '../../events/quick_login_event.dart';
import '../app.dart';

import 'phone_login.dart';
//import '../sign_up/register.dart';
//import '../users/users_agreement.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  QuickLoginController qc = Get.find();
  bool _checked = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _emailController.dispose();
  //   super.dispose();
  // }

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    if (qc.verifyEnable) {
      _subscription = Global.eventBus.on<QuickLoginEvent>().listen((event) {
        _quickLogin(event.token);
      });

      /// TODO 一键登录
      qc.quickLogin();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  /// 在这里请求服务器
  _quickLogin(String token) async {
    // Clipboard.setData(ClipboardData(text: "$token,${qc.ydToken}"));
    print("$token,${qc.ydToken}");

    QuickLoginrequest variables = QuickLoginrequest(
      token: qc.ydToken ?? "",
      accessToken: token,
      // password: duSHA256(_passController.value.text),
    );

    try {
      UserLogin userProfile = await GqlUserAPI.quickLogin(
        context: context,
        variables: variables,
      );
      //UserController.to.loginSuccess(userProfile.data);
    } catch (e) {
      if (kDebugMode) {
        print("===========登录报错内容===============");
        print(e);
      }
      return toastInfo(msg: '一键登录失败,请尝试其他登录方式');
    }

    Get.offAll(const App());
  }

  // 执行登录操作
  _handleSignIn() async {
    if (_checked == true) {
      if (!PFcheck.duCheckStringLength(_passController.value.text, 6)) {
        toastInfo(msg: '登录密码不能小于6位');
        return;
      }

      Loginrequest variables = Loginrequest(
        name: _emailController.value.text,
        password: _passController.value.text,
        // password: duSHA256(_passController.value.text),
      );
      try {
        UserLogin userProfile = await GqlUserAPI.login(
          context: context,
          variables: variables,
        );
        Storage.setInt('isFirstSign', Global.isFirstSign);
        Global.saveProfile(userProfile.data);
      } catch (e) {
        if (kDebugMode) {
          print("===========登录报错内容===============");
          print(e);
        }
        return toastInfo(msg: '请正确输入账号、密码！');
      }
      Get.offAll(const App());
    } else {
      return toastInfo(msg: '请勾选相关协议');
    }
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      margin: EdgeInsets.only(top: 49.h),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 200.w,
            width: 200.w,
            child: SvgPicture.asset("assets/images/logo.svg"),
          ),
          SizedBox(
            height: 70.h,
          ),
          //输入账号
          inputTextEdit(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "请输入账号",
              marginTop: 0,
              //autofocus: true,
              width: 622,
              height: 112),
          // 输入密码
          inputTextEdit(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "请输入密码",
              isPassword: true,
              marginTop: 50,
              width: 622,
              height: 112),
          // 登录
          Container(
            //height: 100.h,
            margin: const EdgeInsets.only(top: 50),
            child: btnFlatButtonWidget(
              width: 750.w,
              height: 112.h,
              onPressed: () => _handleSignIn(),
              gbColor: PFc.primaryElement,
              title: "登录",
            ),
          ),
          SizedBox(height: 50.h),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "没有账号？点击注册",
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed('/signUp');
                      },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "验证码登录",
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(const PhoneLogin());
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _text() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          shape: const CircleBorder(),
          value: _checked,
          onChanged: (v) {
            setState(() {
              _checked = v!;
            });
          },
        ),
        RichText(
          text: TextSpan(
            text: '我已阅读并同意',
            style: const TextStyle(color: Colors.black, fontSize: 13.0),
            children: <TextSpan>[
              TextSpan(
                text: '《服务协议》',
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Get.toNamed(
                      "/agreement",
                      arguments: {
                        "content": Markdowndata.agreementUser,
                        "title": "《服务协议》"
                      },
                    );
                  },
              ),
              const TextSpan(text: '和'),
              TextSpan(
                  text: '《隐私政策》',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Get.toNamed(
                        "/agreement",
                        arguments: {
                          "content": Markdowndata.privacy,
                          "title": "《隐私政策》"
                        },
                      );
                    }),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            _buildInputForm(),
            //const Spacer(),
            _text(),
          ],
        ),
      ),
    );
  }
}
