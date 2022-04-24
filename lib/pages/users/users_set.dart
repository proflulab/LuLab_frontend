//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:proflu/common/utils/cache_util.dart';
import 'package:proflu/common/utils/dialog_util.dart';
import 'package:proflu/pages/users/users_set_about.dart';
import 'package:proflu/pages/users/users_set_user.dart';

import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../pages/sign_in/sign_in.dart';
import 'user_reset_password.dart';

//import 'users_set_account.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _cacheSize = "";

  @override
  void initState() {
    super.initState();
    getCacheSize();
  }

  getCacheSize() async {
    _cacheSize = await CacheUtil.loadCache();
    setState(() {});
  }

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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(PFspace.screenMargin),
              // padding: EdgeInsets.all(PFspace.screenMargin),
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                children: [
                  lineWidget(
                      title: "个人资料",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SetUser(),
                          ),
                        );
                      }),
                  Divider(height: 1, indent: 30.w, endIndent: 30.w),
                  lineWidget(
                      title: "密码重置",
                      //TODO 等待验证码校验修改密码
                      onTap: () {
                        toastInfo(msg: '耐心等待该功能的开发吧！');
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const ResetPasswordPage(),
                        //   ),
                        // );
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(PFspace.screenMargin),
              // padding: EdgeInsets.all(PFspace.screenMargin),
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                children: [
                  lineWidget(
                      title: "当前版本",
                      right: PFtext.text1(
                          text: "v1.0", fontSize: 15, color: PFc.textSecondary),
                      onTap: () {}),
                  Divider(height: 1, indent: 30.w, endIndent: 30.w),
                  lineWidget(
                    title: "清除缓存",
                    right: Row(
                      children: [
                        PFtext.text1(
                            text: _cacheSize,
                            fontSize: 15,
                            color: PFc.textSecondary),
                        Icon(
                          Icons.chevron_right,
                          size: 32.w,
                        )
                      ],
                    ),
                    onTap: _showClearCacheConfirm,
                  ),
                  Divider(height: 1, indent: 30.w, endIndent: 30.w),
                  lineWidget(
                      title: "关于我们",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SetAbout()));
                      }),
                ],
              ),
            ),
            SizedBox(height: 60.w),
            Container(
              height: 100.w,
              width: 700.w,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
              ),
              child: TextButton(
                onPressed: () {
                  DialogUtil.showPopUp(
                    context: context,
                    onConfirm: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                        (route) => route == null,
                      );
                    },
                    content: "是否退出陆向谦实验室",
                  );
                },
                child: const Text(
                  '退出登录',
                  style: TextStyle(
                    fontFamily: 'MyFontStyle',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showClearCacheConfirm() {
    DialogUtil.showPopUp(
      context: context,
      onConfirm: _clearCache,
      content: "是否清除陆向谦实验室App缓存",
    );
  }

  _clearCache() async {
    await CacheUtil.clearCache();
    toastInfo(msg: "清除缓存成功");

    setState(() {
      _cacheSize = "0B";
    });
  }
}
