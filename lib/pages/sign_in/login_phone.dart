import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../events/quick_login_event.dart';
import '../app.dart';
import 'login_password.dart';
import '/pages/sign_in/widget_agreement.dart';
import '/pages/sign_in/widget_phone_field.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/staticdata/staticdata.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';

import '../../controller/quick_login_controller.dart';
import '../../controller/signin_controller.dart';
import 'verification.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  QuickLoginController qc = Get.find();
  final SigninController c = Get.put(SigninController());

  bool _checked = false;

  TextEditingController controller = TextEditingController();

  StreamSubscription? _subscription;

  final FocusNode _accountFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (qc.verifyEnable) {
      _subscription = Global.eventBus.on<QuickLoginEvent>().listen((event) {
        _quickLogin(event.token);
      });
      qc.quickLogin();
    }

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
  }

  @override
  void dispose() {
    _subscription?.cancel();
    controller.dispose();
    _accountFocusNode.dispose();
    super.dispose();
  }

  /// 在这里请求服务器
  _quickLogin(String token) async {
    Clipboard.setData(ClipboardData(text: "$token,${qc.ydToken}"));
    print("$token,${qc.ydToken}");

    QuickLoginReq variables = QuickLoginReq(
      token: qc.ydToken ?? "",
      accessToken: token,
      // password: duSHA256(_passController.value.text),
    );
    try {
      // grahql接口
      // UserLogin userProfile = await GqlUserAPI.quickLogin(
      //   context: context,
      //   variables: variables,
      // );
      QuickLoginRes status =
          await DioUserAPI.quickLogin(context: context, data: variables);
      //UserController.to.loginSuccess(userProfile.data);
      Global.saveToken(status.token ?? "无");
    } catch (e) {
      debugPrint("===========登录报错内容===============");
      if (kDebugMode) {
        print(e);
      }
      return toastInfo(msg: '一键登录失败,请尝试其他登录方式');
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
          //FocusScope.of(context).requestFocus(FocusNode());
          _accountFocusNode.unfocus();
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
                    focusNode: _accountFocusNode,
                    controller: controller,
                    onChanged: (value) {
                      setState(() {
                        value;
                      });
                      if (kDebugMode) {
                        print("你输入的内容为$value");
                      }
                    },
                  ),
                  SizedBox(height: 50.h),
                  _submitButton(),
                  SizedBox(height: 50.h),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "密码登录",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (!_checked) {
                                  _dialog(
                                    () {
                                      Get.to(const SignInPage());
                                    },
                                  );
                                } else {
                                  Get.to(const SignInPage());
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
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
      ),
    );
  }

  _submitButton() {
    return Container(
      width: 1.sw - 2 * 80.w,
      height: 96.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      //padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            shadowColor: MaterialStateProperty.all(Colors.red),
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(31, 245, 138, 138)), //字体颜色
            backgroundColor: MaterialStateProperty.all(
                PFcheck.duIsPhone(controller.value.text)
                    ? PFc.themeColor
                    : const Color.fromARGB(221, 196, 236, 201))),
        onPressed: () {
          if (!PFcheck.duIsPhone(controller.value.text)) {
            toastInfo(msg: '号码格式不正确');
          } else if (PFcheck.duIsPhone(controller.value.text) && !_checked) {
            _dialog(
              () {
                Get.to(
                  const Verification(),
                  arguments: [controller.value.text, c.code],
                );
              },
            );
          } else if (PFcheck.duIsPhone(controller.value.text) && _checked) {
            Get.to(
              const Verification(),
              arguments: [controller.value.text, c.code],
            );
          } else {}
        },
        child: const Text(
          "获取验证码",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ),
    );
  }

  _dialog(onConfirm) {
    return PFDialog.showPopUp(
        onConfirm: onConfirm,
        context: context,
        textConfirm: "同意",
        widget: SizedBox(
          height: 80.h,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: '请先同意',
                style: const TextStyle(color: Colors.black, fontSize: 13.0),
                children: <TextSpan>[
                  TextSpan(
                    text: '《服务协议》',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        Get.toNamed(
                          "/agreement",
                          arguments: {
                            "content": Markdowndata.agreementUser,
                            "title": "《服务协议》"
                          },
                        );
                      },
                  ),
                  const TextSpan(text: '和'),
                  TextSpan(
                    text: '《隐私政策》',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        Get.toNamed(
                          "/agreement",
                          arguments: {
                            "content": Markdowndata.privacy,
                            "title": "《隐私政策》"
                          },
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
