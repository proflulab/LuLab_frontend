import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab/pages/sign_in/agreement.dart';

import '../../common/global/global.dart';
import '../../common/staticdata/staticdata.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';
import '../../controller/signin_controller.dart';
import 'phone_country_code.dart';
import 'verification.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final SigninController c = Get.put(SigninController());

  bool _checked = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1.sh,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/OJJ12.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //   icon: const Icon(Icons.keyboard_arrow_left,
                          //       color: Colors.black),
                          //   onPressed: () {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => const SignInPage()));
                          //   },
                          // ),
                          SvgPicture.asset(
                            "assets/images/logo.svg",
                            height: 100.h,
                          ),
                          SvgPicture.asset("assets/images/proflu_text.svg"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 150),
                    _phoneField(),
                    const SizedBox(height: 50),
                    _submitButton(),
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
            ],
          ),
        ),
      ),
    );
  }

  _phoneField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: Container(
        //alignment: const Alignment(0.1, 0.8),
        //width: 530.w,
        height: 96.h,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color.fromRGBO(233, 234, 237, 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          verticalDirection: VerticalDirection.up,
          children: [
            GestureDetector(
                onTap: () {
                  Get.to(const PhoneCountryCodePage());
                },
                child: Row(
                  children: [
                    Obx(() => Text("+${c.code}")),
                    const Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.black),
                  ],
                )),
            const VerticalDivider(
              color: Colors.grey,
              width: 1,
              indent: 5,
              endIndent: 5,
            ),
            Expanded(
              child: TextField(
                autofocus: false,
                controller: controller,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  LengthLimitingTextInputFormatter(11)
                ],
                decoration: const InputDecoration(
                  hintText: "请输入手机号",
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                  border: InputBorder.none,
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
            controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    icon: const Icon(Icons.close_rounded),
                    padding: const EdgeInsets.all(0.0),
                    // splashColor: Colors.red,
                    // highlightColor: Colors.green,
                  )
                : const Text("")
          ],
        ),
      ),
    );
  }

  _submitButton() {
    return Container(
      // alignment: const Alignment(0.1, 0.1),
      width: 1.sw - 2 * 80.w,
      height: 96.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      //padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(
                PFcheck.duIsPhone(controller.value.text)
                    ? PFc.themeColor
                    : const Color.fromARGB(221, 196, 236, 201))),
        onPressed: () {
          print(Global.packageInfo.packageName);
          if (!PFcheck.duIsPhone(controller.value.text)) {
            toastInfo(msg: '号码格式不正确');
          } else if (PFcheck.duIsPhone(controller.value.text) && !_checked) {
            Get.defaultDialog(
              title: "提示",
              content: RichText(
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
              textConfirm: "确认",
              textCancel: "取消",
              confirmTextColor: Colors.black,
              cancelTextColor: Colors.black,
              radius: 5,
              onConfirm: () {
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
}
