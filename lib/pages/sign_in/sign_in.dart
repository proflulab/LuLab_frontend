import 'package:flutter/material.dart';
import '../../widget/widgets.dart';
import '../../utils/utils.dart';
import '../../values/values.dart';
import '../../api/apis.dart';
import '../../entitys/entitys.dart';
import '../../app.dart';
import '../../global.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // 账号控制器
  final TextEditingController _emailController =
      TextEditingController(text: "shiming");
  // 密码控制器
  final TextEditingController _passController =
      TextEditingController(text: "12345678");

  // 跳转 注册界面
  // _handleNavSignUp() {
  //   ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpPageRoute);
  // }

  // 执行登录操作
  _handleSignIn() async {
    // if (!duIsEmail(_emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }

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
      print("===========登录报错===============");
      print(e);
      return toastInfo(msg: '请正确输入账号、密码！');
    }

    // ExtendedNavigator.rootNavigator
    //     .pushReplacementNamed(Routes.applicationPageRoute);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => App()));
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      //width: fitWidth(295),
      // height: 204,
      margin: EdgeInsets.only(top: fitHeight(49)),
      child: Column(
        children: [
          //输入账号
          inputTextEdit(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "请输入账号",
              marginTop: 200,
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
            margin: EdgeInsets.only(top: 50),
            child: btnFlatButtonWidget(
              width: 622,
              height: 112,
              onPressed: () => _handleSignIn(),
              gbColor: AppColors.primaryElement,
              title: "登录",
            ),
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
            Spacer(),
          ],
        ),
      ),
    );
  }
}
