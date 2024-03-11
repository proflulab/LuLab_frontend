import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/pages/users/users_set_account.dart';
import 'package:lab/pages/users/users_set_account2.dart';

import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/cache_util.dart';
import '../../controller/quick_login_controller.dart';

import '../sign_in/login_phone.dart';
import '/pages/users/users_set_about.dart';
import '/pages/users/users_set_user.dart';

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
        elevation: 0,
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
                  Divider(height: 3.h, indent: 30.w, endIndent: 30.w),
                  lineWidget(
                      title: "账号设置",
                      //TODO 等待验证码校验修改密码
                      onTap: () {
                        Get.to(
                          () => const AccountSetting(),
                        );
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const ResetPasswordPage(),
                        //   ),
                        // );
                      }),
                  Divider(
                    height: 3.h,
                    indent: 30.w,
                    endIndent: 30.w,
                  ),
                  lineWidget(
                      title: "当前版本",
                      right: Row(
                        children: [
                          PFtext.text1(
                              text: "v1.0",
                              fontSize: 15,
                              color: PFc.textSecondary),
                          Icon(
                            Icons.chevron_right,
                            size: 32.w,
                          )
                        ],
                      ),
                      onTap: () {
                        toastInfo(msg: '当前版本为v1.0');
                      }),
                  Divider(height: 3.h, indent: 30.w, endIndent: 30.w),
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
                  Divider(height: 3.h, indent: 30.w, endIndent: 30.w),
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
                  PFDialog.showPopUp(
                    context: context,
                    onConfirm: () {
                      QuickLoginController qc = Get.put(QuickLoginController());
                      Storage.remove(storageUserProfileKey);
                      Get.offAll(const PhoneLogin());
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
    PFDialog.showPopUp(
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
