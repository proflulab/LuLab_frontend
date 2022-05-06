import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proflu/common/utils/utils.dart';

import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'phone_country_code_page.dart';
import 'verification.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  TextEditingController controller = TextEditingController();
  String code = "86";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: _phoneField(),
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 50),
            _submitButton()
          ],
        ),
      ),
    );
  }

  _phoneField() {
    return Container(
      width: 600.w,
      height: 90.h,
      //padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(243, 243, 240, 1),
        borderRadius: PFRadius.a6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                var result = Get.to(const PhoneCountryCodePage());

                if (result != null) {
                  setState(() {
                    //code = result.;
                  });
                }
              },
              child: Row(
                children: [
                  Text("+$code"),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.black),
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
          IconButton(
            onPressed: () {
              controller.text = '';
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  _submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
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
    );
  }
}
