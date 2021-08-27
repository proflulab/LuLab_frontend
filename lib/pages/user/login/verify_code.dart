import 'package:flutter/material.dart';
import 'phone_login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("TextFieldDemo"),
      // ),
      body: VerifyCodeLogin(),
    );
  }
}

class VerifyCodeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 返回行
          BackLineWidget(),
          // 标题行
          TitleLineWidget(),
          Container(
            padding: EdgeInsets.only(top: 100, left: 50, right: 50),
            child: Column(
              children: [
                // 手机号
                PhoneFieldWidget(),
                SizedBox(
                  height: 35,
                ),
                // 验证码
                VerifyFieldWidget(),
                SizedBox(
                  height: 60,
                ),
                SubmitButtonWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 标题行
class TitleLineWidget extends StatelessWidget {
  const TitleLineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 30),
          child: Text(
            "手机号登录",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        )
      ],
    );
  }
}

// 手机号
class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "请输入手机号",
              hintStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          child: Text(
            "+86",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

// 验证码
class VerifyFieldWidget extends StatelessWidget {
  const VerifyFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.verified_user_rounded),
            hintText: "请输入验证码",
            hintStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        // 获取验证码
        SendVerifyCodeWidget()
      ],
    );
  }
}

// 获取验证码
class SendVerifyCodeWidget extends StatelessWidget {
  const SendVerifyCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 100,
      height: 30,
      top: 5,
      right: 20,
      child: TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              BorderSide(color: Colors.blue, width: 1)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        ),
        child: Text(
          "获取验证码",
        ),
        onPressed: () {},
      ),
    );
  }
}

// 提交按钮
class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1500,
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStateProperty.all(Color(0xff0079fe))),
          onPressed: () {},
          child: Text(
            "确定",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
      ),
    );
  }
}
