import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../app.dart';
import '../sign_up/register.dart';
import '../users/package/users_serice_user .dart';
import '../users/package/users_privay_user.dart';
import '../users/package/users_copyrig_user.dart';
import '../users/package/users_featurs_user.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
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
      Global.saveProfile(userProfile);
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
            height: 250.h,
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
          Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: "没有账号？点击注册",
                  style: const TextStyle(
                      fontSize: 25, color: Color.fromARGB(234, 46, 199, 32)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                    }),
            ],
          )),
          Container(
            alignment: const Alignment(-0, 0.5),
            height: 200,
            child: const CustomCheckbox(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildInputForm(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          width: 350,
          height: 80,
          child: Stack(children: <Widget>[
            Align(
              alignment: const Alignment(-0.7, -1.3),
              child: Checkbox(
                  shape: const CircleBorder(),
                  value: _checked,
                  onChanged: (v) {
                    setState(() {
                      _checked = v!;
                    });
                  }),
            ),
            Align(
                alignment: const Alignment(0.1, 1),
                child: SizedBox(
                    width: 190,
                    height: 100,
                    child: Column(children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 11.0,
                          ),
                          // ElevatedButton(
                          //   child: const Text("《.........》,"),
                          //   onPressed: () {},
                          // ),
                          RichText(
                            text: TextSpan(
                              text: '我已阅读陆向谦创新创业实验室,',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13.0),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '《服务使用协议》,',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Service()));
                                      }),
                                TextSpan(
                                    text: '《隐私政策》',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Qrivacy(
                                                      title: '',
                                                    )));
                                      }),
                                TextSpan(
                                    text: ',《版权声明》',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Copyright(
                                                      title: '',
                                                    )));
                                      }),
                                const TextSpan(
                                  text: '和 ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                    text: '《产品特色》',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Features()));
                                      }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ])))
          ]))
    ]);
  }
}
