import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab/common/values/colors.dart';
import '../app.dart';
import '/pages/sign_in/widget_agreement.dart';
import '/pages/sign_in/widget_phone_field.dart';
import '../../common/global/global.dart';
import '../../common/staticdata/staticdata.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';
import '../../controller/signin_controller.dart';
import 'login_verification.dart';
import 'login_verification_email.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> with TickerProviderStateMixin {
  final SigninController c = Get.put(SigninController());

  bool _checked = true;
  bool v = true;
  bool _isValidEmail(String email) {
    // 邮箱格式检查
    return email.isNotEmpty && email.contains('@') && email.contains('.');
  }

  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _accountPasswordController =
      TextEditingController();
  final TextEditingController _passController = TextEditingController();

  StreamSubscription? _subscription;

  final FocusNode _accountFocusNode = FocusNode();
  final FocusNode _accountPasswordFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  // 声明tabcontroller和tab标题
  late TabController _tabController;

  List tabs = ["邮箱", "手机号"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);

    _accountFocusNode.addListener(() {
      if (_accountFocusNode.hasFocus) {
        setState(() {
          debugPrint("有焦点");
        });
      } else {
        setState(() {
          debugPrint("失去焦点");
        });
      }
    });
    _accountPasswordFocusNode.addListener(() {
      if (_accountPasswordFocusNode.hasFocus) {
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

  @override
  void dispose() {
    _subscription?.cancel();
    _accountController.dispose();
    _accountFocusNode.dispose();
    _accountPasswordController.dispose();
    _accountPasswordFocusNode.dispose();
    super.dispose();
  }

  // /// 在这里请求服务器
  // _quickLogin(String token) async {
  //   Clipboard.setData(ClipboardData(text: "$token,${qc.ydToken}"));
  //   print("$token,${qc.ydToken}");
  //
  //   QuickLoginReq variables = QuickLoginReq(
  //     token: qc.ydToken ?? "",
  //     accessToken: token,
  //     // password: duSHA256(_passController.value.text),
  //   );
  //   try {
  //     // grahql接口
  //     // UserLogin userProfile = await GqlUserAPI.quickLogin(
  //     //   context: context,
  //     //   variables: variables,
  //     // );
  //     QuickLoginRes status =
  //         await DioUserAPI.quickLogin(context: context, data: variables);
  //     //UserController.to.loginSuccess(userProfile.data);
  //     Global.saveToken(status.token ?? "无");
  //   } catch (e) {
  //     debugPrint("===========登录报错内容===============");
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     return toastInfo(msg: '一键登录失败,请尝试其他登录方式');
  //   }
  //   Get.offAll(const App());
  // }
  // // 执行登录操作
  // _handleSignIn() async {
  //   if (!PFcheck.duCheckStringLength(_passController.value.text, 0)) {
  //     toastInfo(msg: '登录密码不能为空');
  //     return;
  //   }
  //
  //   Loginrequest variables = Loginrequest(
  //     name: _accountPasswordController.value.text,
  //     password: _passController.value.text,
  //     // password: duSHA256(_passController.value.text),
  //   );
  //
  //   try {
  //     UserLogin userProfile = await GqlUserAPI.login(
  //       context: context,
  //       variables: variables,
  //     );
  //     Storage.setInt('isFirstSign', Global.isFirstSign);
  //     Global.saveProfile(userProfile.data!);
  //     Global.saveToken(userProfile.token!);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("===========登录报错内容===============");
  //       print(e);
  //     }
  //     return toastInfo(msg: '请正确输入账号、密码！');
  //   }
  //   Get.offAll(const App());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          //隐藏键盘
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          //FocusScope.of(context).requestFocus(FocusNode());
          _accountFocusNode.unfocus();
          _accountPasswordFocusNode.unfocus();
          _passFocusNode.unfocus();
        },
        child: SingleChildScrollView(
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
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 200.h,
                  // child: TextButton(
                  //   onPressed: () {
                  //     Global.state = UserState.visitor;
                  //     Get.offAll(const App());
                  //   },
                  //   child: Text('游客登录'),
                  // ),
                ),
                // SizedBox(height: 100.h),
                Container(
                  // 使用 Alignment 进行自适应偏移
                  child: Transform.scale(
                    scale: 1.3,
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      height: 100.h,
                    ),
                  ),
                  alignment: Alignment(-0.9, 0.0), // 将图标稍微向右偏移
                ),

                SizedBox(height: 50.h),
                Container(
                  width: 1.sw - 2 * 30.w,
                  child: Text(
                    "欢迎来到陆向谦实验室",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: "MyFontStyle",
                      color: Colors.black,
                      fontSize: 60.sp,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),
                _buildTabNavigation(),
                SizedBox(height: 40.h),
                SizedBox(
                  height: 260.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _VerifyWay(),
                      _PasswordWay(),
                    ],
                  ),
                ),
                // SizedBox(height: 30.h),
                // PhoneField(
                //   focusNode: _accountFocusNode,
                //   controller: _accountController,
                //   onChanged: (value) {
                //     //c.innumber(value);
                //     setState(() {
                //       value;
                //     });
                //     if (kDebugMode) {
                //       print("你输入的内容为$value");
                //     }
                //   },
                // ),
                // SizedBox(height: 50.h),
                // _submitButton(),
                // SizedBox(height: 50.h),
                // Center(
                //   child: Text.rich(
                //     TextSpan(
                //       children: [
                //         TextSpan(
                //           text: "密码登录",
                //           style: const TextStyle(
                //               fontSize: 18, color: Colors.grey),
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               if (!_checked) {
                //                 _dialog(
                //                   () {
                //                     setState(() {
                //                       _checked = !_checked;
                //                     });
                //                     _accountFocusNode.unfocus();
                //                     Get.to(const SignInPage());
                //                   },
                //                 );
                //               } else {
                //                 _accountFocusNode.unfocus();
                //                 Get.to(const SignInPage());
                //               }
                //             },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                AgreementWidget(
                  checked: _checked,
                  onChanged: (v) {
                    PFVibrate.feedback(Type.medium);
                    setState(() {
                      _checked = v!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigateToVerificationPage(String phoneNumber) {
    Get.to(
      const Verification(a: '1'),
      arguments: [phoneNumber, c.code.value],
    );
  }

  _navigateToVerificationPage1(String phoneNumber) {
    Get.to(
      const Verification1(a1: '2'),
      arguments: [phoneNumber, c.code.value],
    );
  }

  _submitButton() {
    return Container(
      width: 1.sw - 2 * 30.w,
      height: 96.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          shadowColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(
              const Color.fromARGB(31, 245, 138, 138)), //字体颜色
          backgroundColor: MaterialStateProperty.all(
            _isValidEmail(_accountController.text)
                ? PFc.themeColor
                : const Color.fromARGB(221, 196, 236, 201),
          ),
        ),
        onPressed: () {
          if (!_isValidEmail(_accountController.text)) {
            PFbattery.client();
            toastInfo(msg: '邮箱格式不正确');
          } else if (!_checked) {
            _dialog(
              () {
                // Call the new navigation method with the email value
                _navigateToVerificationPage1(_accountController.value.text);
              },
            );
          } else {
            // Call the new navigation method with the email value
            _navigateToVerificationPage1(_accountController.value.text);
          }
        },
        child: const Text(
          "下一步",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            textBaseline: TextBaseline.alphabetic,
            fontFamily: "MyFontStyle",
          ),
        ),
      ),
    );
  }

  _submitPasswordButton() {
    return Container(
      width: 1.sw - 2 * 30.w,
      height: 96.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          shadowColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(
              const Color.fromARGB(31, 245, 138, 138)), //字体颜色
          backgroundColor: MaterialStateProperty.all(
            _accountPasswordController.value.text.isNotEmpty
                ? PFc.themeColor
                : const Color.fromARGB(221, 196, 236, 201),
          ),
        ),
        onPressed: () {
          if (!_checked) {
            _dialog(
              () {
                // Call the new navigation method with the phone number value
                _navigateToVerificationPage(
                    _accountPasswordController.value.text);
              },
            );
          } else if (_checked) {
            // Call the new navigation method with the phone number value
            _navigateToVerificationPage(_accountPasswordController.value.text);
          }
        },
        child: const Text(
          "下一步",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            textBaseline: TextBaseline.alphabetic,
            fontFamily: "MyFontStyle",
          ),
        ),
      ),
    );
  }

  _dialog(onConfirm) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            "提示",
            style: TextStyle(fontFamily: "MyFontStyle", fontSize: 20.0),
          ),
          content: SizedBox(
            width: 400.w, // Adjust the width here
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: '\n请先同意',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: "MyFontStyle",
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' 服务协议 ',
                      style: const TextStyle(color: Colors.green),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Get.toNamed(
                            "/agreement",
                            arguments: {
                              "content": Markdowndata.agreementUser,
                              "title": " 服务协议 ",
                            },
                          );
                        },
                    ),
                    const TextSpan(text: '和'),
                    TextSpan(
                      text: ' 隐私政策',
                      style: const TextStyle(
                        color: Colors.green,
                        fontFamily: "MyFontStyle",
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Get.toNamed(
                            "/agreement",
                            arguments: {
                              "content": Markdowndata.privacy,
                              "title": " 隐私政策",
                            },
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text(
                "取消",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: "MyFontStyle",
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: const Text(
                "同意",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                  fontFamily: "MyFontStyle",
                ),
              ),
              onPressed: () {
                setState(() {
                  _checked = true;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _VerifyWay() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Container(
            height: 96.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
              border: Border.all(
                color: _accountFocusNode.hasFocus
                    ? Colors.green // 用户点击时边框颜色变绿
                    : Colors.grey, // 默认边框颜色
              ),
            ),
            child: TextField(
              autofocus: false,
              focusNode: _accountFocusNode,
              controller: _accountController,
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp('[\u4e00-\u9fa5]')), // 只允许输入英文和数字
              ],
              decoration: const InputDecoration(
                hintText: "请输入您的邮箱",
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontFamily: _accountController.text.isEmpty
                    ? "MyFontStyle" // 未输入内容时使用行楷体
                    : Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .fontFamily, // 输入内容后使用系统默认字体
                fontSize: 20,
                color: _accountController.text.isEmpty
                    ? Colors.grey // 未输入内容时字体颜色为灰色
                    : Colors.black, // 输入内容后字体颜色为黑色
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
            ),
          ),
        ),
        SizedBox(height: 50.h),
        _submitButton(),
      ],
    );
  }

  _PasswordWay() {
    return Column(
      children: [
        PhoneField(
          controller: _accountPasswordController,
          onChanged: (value) {
            //c.innumber(value);
            setState(() {
              value;
            });
            if (kDebugMode) {
              print("你输入的内容为$value");
            }
          },
          focusNode: _accountPasswordFocusNode,
        ),
        // SizedBox(height: 50.h),
        // PFTextField(
        //   focusNode: _passFocusNode,
        //   controller: _passController,
        //   hintText: "请输入密码",
        //   obscureText: v,
        //   width: 1.sw - 2 * 30.w,
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
        _submitPasswordButton(),
      ],
    );
  }

  // tab栏具体实现
  _buildTabNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _tabBar(),
      ],
    );
  }

  _tabBar() {
    return HiTab(
      tabs.map<Tab>((name) {
        return Tab(
          text: name,
        );
      }).toList(),
      controller: _tabController,
    );
  }
}
