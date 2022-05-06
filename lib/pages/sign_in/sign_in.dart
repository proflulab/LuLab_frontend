import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proflu/controller/user_controller.dart';
import 'package:proflu/pages/sign_in/agreement_widget.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../controller/quick_login_controller.dart';
import '../../events/quick_login_event.dart';
import '../app.dart';
import '../sign_up/register.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  QuickLoginController qc = Get.find();

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
      UserController.to.loginSuccess(userProfile.data);
    } catch (e) {
      if (kDebugMode) {
        print("===========登录报错内容===============");
        print(e);
      }
      return toastInfo(msg: '一键登录失败,请尝试其他登录方式');
    }

    // ExtendedNavigator.rootNavigator
    //     .pushReplacementNamed(Routes.applicationPageRoute);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const App()));

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const App()),
      (route) => route == null,
    );
  }

  bool _checked = false;
  // 账号控制器
  final TextEditingController _emailController =
      TextEditingController(text: "");
  // 密码控制器
  final TextEditingController _passController = TextEditingController(text: "");

  // 跳转 注册界面
  // _handleNavSignUp() {
  //   ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpPageRoute);
  // }

  // 执行登录操作
  _handleSignIn() async {
    if (_checked == true) {
      if (!duCheckStringLength(_passController.value.text, 6)) {
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
        UserController.to.loginSuccess(userProfile.data);
      } catch (e) {
        if (kDebugMode) {
          print("===========登录报错内容===============");
          print(e);
        }
        return toastInfo(msg: '请正确输入账号、密码！');
      }

      // ExtendedNavigator.rootNavigator
      //     .pushReplacementNamed(Routes.applicationPageRoute);
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => const App()));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const App()),
        (route) => route == null,
      );
    } else {
      return toastInfo(msg: '请勾选相关协议');
    }
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      //width: fitWidth(295),
      // height: 204,
      margin: EdgeInsets.only(top: fitHeight(49)),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                height: 124.w,
                width: 480.w,
                child: Image.asset("assets/images/login_logo.png"),
              ),
            ],
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
              autofocus: true,
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
              width: 622,
              height: 112,
              onPressed: () => _handleSignIn(),
              gbColor: PFc.primaryElement,
              title: "登录",
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "没有账号？点击注册",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: "MyFontStyle"),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
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
    return AgreementWidget(
        agree: _checked,
        onTap: () {
          setState(() {
            _checked = !_checked;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: true,
        child: Column(
          children: <Widget>[
            _buildInputForm(),
            const Spacer(),
            _text(),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
