import 'package:flutter/material.dart';
import 'phone_login.dart';


class VerifyCodeLogin1 extends StatelessWidget {
  const VerifyCodeLogin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text("TextFieldDemo"),
      // ),
      body: VerifyCodeLogin(),
    );
  }
}

class VerifyCodeLogin extends StatelessWidget {
  const VerifyCodeLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 返回行
          BackLineWidget(
            txt: "验证码登录",
          ),
          // 标题行
          const TitleLineWidget(),
          Container(
            padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
            child: Column(
              children: const [
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 30),
          child: const Text(
            "密码登录",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, top: 30),
          child: const Text(
            "忘记密码",
            style: TextStyle(color: Colors.lightBlue),
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
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 40),
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
      children: const [
        TextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password),
            hintText: "请输入密码",
            hintStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
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
              const BorderSide(color: Colors.blue, width: 1)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        ),
        child: const Text(
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
    return SizedBox(
      width: 1500,
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStateProperty.all(const Color(0xff0079fe))),
          onPressed: () {},
          child: const Text(
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
