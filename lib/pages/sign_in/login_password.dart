import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

import '../app.dart';
import '/pages/sign_in/widget_phone_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  bool v = true;

  final FocusNode _accountFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _accountFocusNode.addListener(() {
      if (_accountFocusNode.hasFocus) {
        setState(() {
          debugPrint("有账号输入框焦点");
        });
      } else {
        setState(() {
          debugPrint("失去账号输入框焦点");
        });
      }
    });

    _passFocusNode.addListener(() {
      if (_passFocusNode.hasFocus) {
        setState(() {
          debugPrint("有密码输入框焦点");
        });
      } else {
        setState(() {
          debugPrint("失去密码输入框焦点");
        });
      }
    });
  }

//页面销毁
  @override
  void dispose() {
    super.dispose();
    //释放
    _accountFocusNode.dispose();
  }

  // 执行登录操作
  _handleSignIn() async {
    if (!PFcheck.duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '登录密码不能小于6位');
      return;
    }

    Loginrequest variables = Loginrequest(
      name: _emailController.value.text,
      password: _passController.value.text,
      // password: duSHA256(_passController.value.text),
    );

    try {
      UserLogin userProfile = await GqlUserAPI.login(
        context: context,
        variables: variables,
      );
      Storage.setInt('isFirstSign', Global.isFirstSign);
      Global.saveProfile(userProfile.data!);
      Global.saveToken(userProfile.token!);
    } catch (e) {
      if (kDebugMode) {
        print("===========登录报错内容===============");
        print(e);
      }
      return toastInfo(msg: '请正确输入账号、密码！');
    }
    Get.offAll(const App());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          //隐藏键盘
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          _accountFocusNode.unfocus();
          _passFocusNode.unfocus();
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: 1.sh,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/OJJ12.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100.h),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/logo.svg",
                            height: 100.h),
                        SvgPicture.asset("assets/images/proflu_text.svg"),
                      ],
                    ),
                  ),
                  SizedBox(height: 150.h),
                  PhoneField(
                    controller: _emailController,
                    onChanged: (value) {
                      setState(() {
                        value;
                      });
                      if (kDebugMode) {
                        print("你输入的内容为$value");
                      }
                    },
                    focusNode: _accountFocusNode,
                  ),
                  SizedBox(height: 50.h),
                  PFTextField(
                    focusNode: _passFocusNode,
                    controller: _passController,
                    hintText: "请输入密码",
                    obscureText: v,
                    width: 1.sw - 2 * 80.w,
                    height: 96.h,
                    color: const Color.fromRGBO(233, 234, 237, 1),
                    suffixIcon: IconButton(
                      icon: Center(
                        child: v
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.remove_red_eye_rounded),
                      ),
                      color: PFc.themeColor,
                      //padding: const EdgeInsets.all(11.0),
                      alignment: Alignment.bottomCenter,
                      onPressed: () {
                        setState(() {
                          v = !v;
                        });
                      },
                    ),
                  ),
                  // inputTextEdit(
                  //   controller: _passController,
                  //   keyboardType: TextInputType.visiblePassword,
                  //   hintText: "请输入密码",
                  //   isPassword: v,
                  //   width: 1.sw - 2 * 80.w,
                  //   height: 96.h,
                  //   color: const Color.fromRGBO(233, 234, 237, 1),
                  //   suffixIcon: IconButton(
                  //     icon: Center(
                  //       child: v
                  //           ? const Icon(Icons.remove_red_eye_outlined)
                  //           : const Icon(Icons.remove_red_eye_rounded),
                  //     ),
                  //     color: PFc.themeColor,
                  //     //padding: const EdgeInsets.all(11.0),
                  //     alignment: Alignment.bottomCenter,
                  //     onPressed: () {
                  //       setState(() {
                  //         v = !v;
                  //       });
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 50.h),
                  // 登录
                  btnFlatButtonWidget(
                    width: 1.sw - 2 * 80.w,
                    height: 96.h,
                    onPressed: () => _handleSignIn(),
                    gbColor: PFc.primaryElement,
                    title: "登录",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
