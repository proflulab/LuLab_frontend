import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/staticdata/staticdata.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../app.dart';
import '../sign_up/register.dart';
import '../users/users_agreement.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // QuickLoginController qc = Get.find();

  // StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    // if (qc.verifyEnable) {
    //   _subscription = Global.eventBus.on<QuickLoginEvent>().listen((event) {
    //     _quickLogin(event.token);
    //   });

    //   qc.quickLogin();
    // }
  }

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  /// 在这里请求服务器
  _quickLogin(String token) {
    Clipboard.setData(ClipboardData(text: token));
    toastInfo(msg: "授权码已复制");
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
        Storage.setInt('isFirstSign', Global.isFirstSign);
        Global.saveProfile(userProfile.data);
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
              width: 750.w,
              height: 112.h,
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
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Agreement(
                              data: Markdowndata.agreementUser,
                              title: '《服务协议》',
                            )));
                  },
              ),
              const TextSpan(text: '和'),
              TextSpan(
                  text: '《隐私政策》',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Agreement(
                                data: Markdowndata.agreementUser,
                                title: '《隐私政策》',
                              )));
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
      resizeToAvoidBottomInset: false,
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
