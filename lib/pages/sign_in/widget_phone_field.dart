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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: Container(
        //alignment: const Alignment(0.1, 0.8),
        //width: 530.w,
        height: 96.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: const Color.fromRGBO(233, 234, 237, 1),
          border: widget.focusNode.hasFocus
              ? Border.all(color: PFc.themeColor)
              : Border.all(color: const Color.fromARGB(0, 0, 0, 0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          //verticalDirection: VerticalDirection.up,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const PhoneCountryCodePage());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => PFtext.text3(text: "+${c.code}", fontSize: 18)),
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
                  LengthLimitingTextInputFormatter(11)
                ],
                decoration: const InputDecoration(
                  hintText: "请输入手机号",
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 7),
                  border: InputBorder.none,
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
                    // splashColor: Colors.red,
                    // highlightColor: Colors.green,
                  )
                : const Text("")
          ],
        ),
      ),
    );
  }
}
