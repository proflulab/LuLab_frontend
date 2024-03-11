import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/pages/users/users_set_account.dart';

import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/cache_util.dart';
import '../../controller/quick_login_controller.dart';

import '../sign_in/login_phone.dart';
import '../sign_in/login_verification.dart';
import '/pages/users/users_set_about.dart';
import '/pages/users/users_set_user.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  void initState() {
    super.initState();
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
          '账号设置',
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
            SizedBox(height: 40.w),
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
                      title: "修改密码",
                      onTap: () {
                        Get.to(
                          () => const Verification(
                            a: '2',
                          ),
                          arguments: ["15110880530", "+86"],
                        );
                      }),
                  Divider(height: 3.h, indent: 30.w, endIndent: 30.w),
                  lineWidget(
                      title: "手机号",
                      right: Row(
                        children: [
                          PFtext.text1(
                              text: "15110880530",
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
                      title: "注销账号",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SetUser(),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
