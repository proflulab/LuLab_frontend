import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';
import '../../pages/sign_in/sign_in.dart';
import 'package/users_home_page_user.dart';
import 'users_page.dart';
import 'users_set_user.dart';

//import 'users_set_account.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    //double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '设置',
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: Colors.green,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UsersPage()));
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: [
                listtilebotton(
                    bottomname: "个人信息",
                    icon: const Icon(Icons.ac_unit),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SetUser()));
                    },
                    context: context),
                const Divider(),
                listtilebotton(
                    bottomname: "关于我们",
                    icon: const Icon(Icons.ac_unit),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Dty()));
                    },
                    context: context),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 100.h,
            width: 700.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                  (route) => route == null,
                );
              },
              child: const Text(
                '退出登录',
                style: TextStyle(
                  fontFamily: 'MyFontStyle',
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
