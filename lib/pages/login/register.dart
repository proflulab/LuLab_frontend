import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          PhoneWidget(),
          SizedBox(
            height: 50,
          ),
          PasswordWidget(),
          SizedBox(
            height: 50,
          ),
          RegisterWidget()
        ],
      ),
    );
  }
}

// 手机号
class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: "请输入手机号",
      ),
    );
  }
}

// 密码框
class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password_sharp),
        hintText: "请输入密码",
      ),
    );
  }
}

// 注册
class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "注册",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ),
    );
  }
}
