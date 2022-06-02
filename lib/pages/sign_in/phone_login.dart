import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/staticdata/staticdata.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';
import '../../controller/signin_controller.dart';
import 'phone_country_code_page.dart';
import 'verification.dart';
import '../sign_in/sign_in.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final SigninController c = Get.put(SigninController());

  // bool _checked = false;

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
                          // Image.asset(
                          //   "assets/images/OJJ12.png",
                          //   height: 700.h,
                          // ),
                          SvgPicture.asset("assets/images/proflu_text.svg"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: _phoneField(),
                    ),
                    Container(
                      child: _submitButton(),
                    ),
                    const Ing(),
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
    return Column(
      children: [
        Container(
          height: 150,
        ),
        Container(
          alignment: const Alignment(0.1, 0.8),
          width: 530.w,
          height: 90.h,
          //padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color.fromRGBO(233, 234, 237, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(const PhoneCountryCodePage());
                  },
                  child: Row(
                    children: [
                      Obx(() => Text("+${c.code}")),
                      const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                    ],
                  )),
              const VerticalDivider(
                  color: Colors.grey, width: 1, indent: 5, endIndent: 5),
              Expanded(
                child: TextField(
                  autofocus: true,
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
              // IconButton(
              //   onPressed: () {
              //     controller.text = '';
              //   },
              //   icon: const Icon(Icons.close),
              // ),
            ],
          ),
        )
      ],
    );
  }

  _submitButton() {
    return Column(
      children: [
        Container(
          height: 30,
        ),
        Container(
          // alignment: const Alignment(0.1, 0.1),
          width: 500,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  backgroundColor: MaterialStateProperty.all(
                      PFcheck.duIsPhone(controller.value.text)
                          ? PFc.themeColor
                          : const Color.fromARGB(221, 196, 236, 201))),
              onPressed: () {
                if (PFcheck.duIsPhone(controller.value.text)) {
                  Get.to(
                    const Verification(),
                    arguments: controller.value.text,
                  );
                } else {
                  toastInfo(msg: '号码格式不正确');
                }
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
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        )
      ],
    );
  }
}

class Ing extends StatefulWidget {
  const Ing({Key? key}) : super(key: key);

  @override
  State<Ing> createState() => _IngState();
}

class _IngState extends State<Ing> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
        ),
        Checkbox(
          shape: const CircleBorder(),
          value: _checked,
          onChanged: (v) {
            setState(() {
              _checked = v!;
            });
          },
        ),
        RichText(
          text: TextSpan(
            text: '我已阅读并同意',
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
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
