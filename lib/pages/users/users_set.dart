//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:proflu/common/utils/cache_util.dart';
import 'package:proflu/pages/users/users_set_about.dart';

import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../pages/sign_in/sign_in.dart';

import 'users_set_user.dart';

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
                  _lineWidget(
                      title: "个人资料",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SetUser(),
                          ),
                        );
                      }),
                  const Divider(height: 1),
                  _lineWidget(
                      title: "密码重置",
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const SetUser(),
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
                  _lineWidget(
                      title: "当前版本",
                      right: PFtext.text1(
                          text: "v1.0", fontSize: 15, color: PFc.textSecondary),
                      onTap: () {}),
                  const Divider(height: 1),
                  _lineWidget(
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
                  const Divider(height: 1),
                  _lineWidget(
                      title: "关于我们",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SetAbout()));
                      }),
                ],
              ),
            ),
            const Spacer(),
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

  Widget _lineWidget(
      {required String title, Widget? right, required Function onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap();
      },
      child: Container(
        height: 96.w,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          children: [
            PFtext.text1(text: title, fontSize: 15),
            const Spacer(),
            right ??
                Icon(
                  Icons.chevron_right,
                  size: 32.w,
                )
          ],
        ),
      ),
    );
  }

  _showClearCacheConfirm() {
    YYDialog().build(context)
      ..width = 502.w
      ..height = 244.w
      ..borderRadius = 10
      ..widget(SizedBox(
        height: 244.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PFtext.text2(text: "提示", fontSize: 16),
            SizedBox(height: 20.w),
            PFtext.text2(text: "是否清除陆向谦实验室App缓存", fontSize: 14),
            SizedBox(height: 30.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 180.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.w),
                      color: const Color(0xffDFDFDF),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "取消",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                    _clearCache();
                  },
                  child: Container(
                    width: 180.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.w),
                      color: const Color(0xff4DC460),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "确定",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ))
      ..show();
  }

  _clearCache() async {
    await CacheUtil.clearCache();
    toastInfo(msg: "清除缓存成功");

    setState(() {
      _cacheSize = "0B";
    });
  }
}
