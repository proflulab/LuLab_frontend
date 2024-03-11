import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab/common/widget/text_widget.dart';
import '../../common/values/values.dart';
import '../../common/utils/utils.dart';
import '../../controller/signin_controller.dart';
import 'phone_country_code.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FocusNode focusNode;

  const PhoneField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final SigninController c = Get.put(SigninController());
  bool isPhoneNumberValid = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(validatePhoneNumber);
  }

  @override
  void dispose() {
    widget.controller.removeListener(validatePhoneNumber);
    super.dispose();
  }

  void validatePhoneNumber() {
    final phoneNumber = widget.controller.text.trim();
    // Check if the phone number (excluding country code) is exactly 11 digits long
    if (c.code == "+86") {
      isPhoneNumberValid = phoneNumber.length == 11;
    } else {
      // For other country codes, we don't enforce length restrictions
      isPhoneNumberValid = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        height: 96.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
          border: widget.focusNode.hasFocus
              ? Border.all(color: PFc.themeColor)
              : Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const PhoneCountryCodePage());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => PFtext.text3(text: "${c.code}", fontSize: 18)),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.black),
                ],
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              width: 2,
              indent: 4,
              endIndent: 4,
            ),
            Expanded(
              child: TextField(
                autofocus: false,
                focusNode: widget.focusNode,
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: const InputDecoration(
                  hintText: "请输入您的手机号",
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 7),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontFamily: "MyFontStyle",
                  fontSize: 20,
                  color: Colors.black,
                ),
                maxLines: 1,
                autocorrect: false,
                onChanged: widget.onChanged,
              ),
            ),
            widget.controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.controller.clear();
                      });
                    },
                    icon: const Icon(Icons.close_rounded),
                    padding: const EdgeInsets.all(0.0),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
