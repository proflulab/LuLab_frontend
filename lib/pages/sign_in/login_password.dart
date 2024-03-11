import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab/common/entitys/data_login_password.dart';
import 'package:lab/pages/sign_in/login_verification.dart';
import 'package:lab/pages/sign_in/login_verification_email.dart';
import 'package:pinput/pinput.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

import '../../controller/signin_controller.dart';
import '../app.dart';
import '/pages/sign_in/widget_phone_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final SigninController c = Get.put(SigninController());
  bool v = true;

  final FocusNode _accountFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  late LoginPassword _loginPassword;

  @override
  void initState() {
    super.initState();
    //_accountController.text = c.number;
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
    _accountController.dispose();
    _accountFocusNode.dispose();
  }

  // 执行登录操作
  _handleSignIn() async {
    if (!PFcheck.duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '登录密码不能小于6位');
      return;
    }

    LoginPasswordRequest variables = LoginPasswordRequest(
      mobile: _accountController.value.text,
      area: "+86",
      password: _passController.value.text,
      // password: duSHA256(_passController.value.text),
    );

    try {
      LoginPassword loginPassword = await GqlUserAPI.loginPassword(
          context: context, variables: variables);
      Storage.setInt('isFirstSign', Global.isFirstSign);
      Global.saveToken(loginPassword.token);
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
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _accountFocusNode.unfocus();
        _passFocusNode.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: 1.sh,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/DLLC.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Column(children: [
                  Transform.translate(
                    offset: const Offset(-20, 30),
                    child: IconButton(
                      icon: Transform.scale(
                        scale: 1.0,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(20, 50),
                    child: const Text(
                      "输入密码",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: "MyFontStyle",
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 10.h),
                Transform.translate(
                  offset: const Offset(22, -5),
                ),
                SizedBox(height: 150.h),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Container(
                      height: 96.h,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(
                          color: _accountFocusNode.hasFocus
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              autofocus: false,
                              focusNode: _accountFocusNode,
                              controller: _accountController,
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp('[\u4e00-\u9fa5]')),
                                LengthLimitingTextInputFormatter(16),
                              ],
                              decoration: const InputDecoration(
                                hintText: "请输入您的密码",
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 10, 0, 7),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontFamily: _accountController.text.isEmpty
                                    ? "MyFontStyle"
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .fontFamily,
                                fontSize: 20,
                                color: _accountController.text.isEmpty
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                              onChanged: (value) {
                                setState(() {
                                  value;
                                });
                                if (kDebugMode) {
                                  print("你输入的内容为$value");
                                }
                              },
                              obscureText: v,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -8),
                            child: IconButton(
                              icon: Center(
                                child: v
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.remove_red_eye_rounded),
                              ),
                              color: PFc.themeColor,
                              onPressed: () {
                                setState(() {
                                  v = !v;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Transform.translate(
                    offset: const Offset(22, 10),
                    child: const Text(
                      "切换到验证码登录",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: "MyFontStyle",
                        color: PFc.themeColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
