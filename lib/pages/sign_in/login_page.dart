import 'package:flutter/material.dart';

import 'login.dart';
import '../agreement/agreement_use.dart';

//二级见面手机一键登录
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: <Widget>[
          const SizedBox(height: 31.0),
          //应用图标与应用名称
          Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Login1()));
                },
                iconSize: 38.0,
                icon: const Icon(Icons.keyboard_arrow_left),
              ),
            ]),
            const SizedBox(
              height: 41.0,
            ),
            const Text(
              '本机号码一键登录',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 58.0,
            ),
            const Text(
              '12345678',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              '中国电信提供认证服务',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextButton(
              autofocus: true,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                shape: MaterialStateProperty.all(const StadiumBorder()),
                minimumSize: MaterialStateProperty.all(const Size(280, 40)),
              ),
              child: const Text(
                "一键登录",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              autofocus: true,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const StadiumBorder()),
                minimumSize: MaterialStateProperty.all(const Size(280, 40)),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.grey, width: 1)),
              ),
              child: const Text(
                "切换账号",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 154.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextButton(
                child: Image.asset(
                  'assets/images/微信.png',
                  height: 24,
                  width: 24,
                ),
                autofocus: true,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  minimumSize: MaterialStateProperty.all(const Size(36, 36)),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey, width: 1)),
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 40.0,
              ),
              TextButton(
                child: Image.asset(
                  'assets/images/QQ.png',
                  height: 24,
                  width: 24,
                ),
                autofocus: true,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  minimumSize: MaterialStateProperty.all(const Size(36, 36)),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey, width: 1)),
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 40.0,
              ),
              TextButton(
                child: Image.asset(
                  'assets/images/微博.png',
                  height: 24,
                  width: 24,
                ),
                autofocus: true,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  minimumSize: MaterialStateProperty.all(const Size(36, 36)),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey, width: 1)),
                ),
                onPressed: () {},
              ),
            ]),
            const SizedBox(
              height: 86.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextButton(
                child: const Text(
                  '用户协议',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const UserAgreement()));
                },
              ),
              const Text('及',
                  style: TextStyle(
                    //color: Colors.deepPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  )),
              TextButton(
                child: const Text(
                  '隐私政策',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {},
              ),
              const Text('，中国电信认证服务条款',
                  style: TextStyle(
                    //color: Colors.deepPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))
            ])
          ]),
        ]),
      ),
    );
  }
}
