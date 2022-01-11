import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widget/widgets.dart';
import '../../utils/utils.dart';
import '../../api/apis.dart';
import '../../entitys/entitys.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // fullName email password 的控制器
  final TextEditingController _fullnameController =
      TextEditingController(text: "shiming");
  final TextEditingController _passController1 =
      TextEditingController(text: "12345678");
  final TextEditingController _passController =
      TextEditingController(text: "12345678");

  // // 返回上一页
  // _handleNavPop() {
  //   Navigator.pop(context);
  // }

  // 执行注册操作
  _handleSignUp() async {
    if (!duCheckStringLength(_fullnameController.value.text, 3)) {
      toastInfo(msg: '用户名不能小于3位');
      return;
    }
    if (!duCheckStringLength(_passController1.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    if (_passController1.value.text != _passController.value.text) {
      toastInfo(msg: '两次密码不一样');
      return;
    }
    Registeredrequest variables = Registeredrequest(
      name: _fullnameController.value.text,
      password: _passController1.value.text,
      ensurePassword: _passController.value.text,
      // password: duSHA256(_passController.value.text),
    );

    //print(variables.name);
    try {
      await GqlUserAPI.register(
        context: context,
        variables: variables,
      );

      toastInfo(msg: '注册成功，返回登录页!');
    } catch (e) {
      if (kDebugMode) {
        print("打印错误信息");
      }
      if (kDebugMode) {
        print(e);
      }
      return toastInfo(msg: '注册失败，请正确输入账号、密码!');
    }

    Navigator.pop(context);
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      //width: 622,
      // height: 204,
      margin: EdgeInsets.only(top: fitHeight(100)),
      child: Column(
        children: [
          // 用户名
          inputTextEdit(
            controller: _fullnameController,
            keyboardType: TextInputType.text,
            hintText: "账号",
            marginTop: 0,
            width: 622,
            height: 112,
          ),
          // 输入密码
          inputTextEdit(
            controller: _passController1,
            keyboardType: TextInputType.visiblePassword,
            hintText: "输入密码",
            isPassword: true,
            marginTop: 48,
            width: 622,
            height: 112,
          ),
          // 确认密码
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "确认密码",
            isPassword: true,
            marginTop: 48,
            width: 622,
            height: 112,
          ),

          // 注册
          Container(
            margin: EdgeInsets.only(top: fitHeight(15)),
            child: btnFlatButtonWidget(
              onPressed: _handleSignUp,
              width: 622,
              height: 112,
              fontWeight: FontWeight.w600,
              title: "注册",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 100.h),
            _buildInputForm(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
