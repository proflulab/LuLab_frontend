import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../common/widget/widgets.dart';

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
          title: const Text(
            '设置',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          //centerTitle: true,
        ),
        body: Column(
          children: [
            listtilebotton(
                bottomname: "个人信息",
                icon: const Icon(Icons.ac_unit),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SetUser()));
                },
                context: context),
            listtilebotton(
                bottomname: "账号设置",
                icon: const Icon(Icons.ac_unit),
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => SetAccount()));
                },
                context: context),
            listtilebotton(
                bottomname: "软件升级",
                icon: const Icon(Icons.ac_unit),
                onPressed: () {
                  if (kDebugMode) {
                    print("object");
                  }
                },
                context: context),
            listtilebotton(
                bottomname: "清理缓存",
                icon: const Icon(Icons.ac_unit),
                onPressed: () {
                  if (kDebugMode) {
                    print("object");
                  }
                },
                context: context),
            listtilebotton(
                bottomname: "关于我们",
                icon: const Icon(Icons.ac_unit),
                onPressed: () {
                  bounceBottomSheet(context, const Text("data"));
                },
                context: context),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                  top: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("退出登录");
                  }
                },
                child: const Text(
                  '退出登录',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
