import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proflu/pages/sign_in/agreement_widget.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // fullName email password 的控制器
  final TextEditingController _fullnameController =
      TextEditingController(text: "");
  final TextEditingController _passController1 =
      TextEditingController(text: "");
  final TextEditingController _passController = TextEditingController(text: "");
  bool agree = false;
  // 返回上一页
  // _handleNavPop() {
  //   Navigator.pop(context);
  // }

  // 执行注册操作
  _handleSignUp() async {
    if (!agree) {
      toastInfo(msg: '请阅读并同意用户协议');
      return;
    }
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
            margin: EdgeInsets.only(top: fitHeight(48)),
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            alignment: Alignment.center,
            child: ClipOval(
              child: Container(
                width: 82.w,
                height: 82.w,
                decoration: const BoxDecoration(color: Color(0xffE6E6E6)),
                alignment: Alignment.center,
                child: Icon(
                  Icons.chevron_left_outlined,
                  size: 60.w,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        child: Center(
          child: Column(
            children: <Widget>[
              _buildInputForm(),
              const Spacer(),
              AgreementWidget(
                  agree: agree,
                  onTap: () {
                    setState(() {
                      agree = !agree;
                    });
                  }),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
