import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/values.dart';
import '../../common/staticdata/staticdata.dart';

class AgreementWidget extends StatefulWidget {
  final bool checked;
  final ValueChanged<bool?>? onChanged;
  const AgreementWidget({Key? key, required this.checked, this.onChanged})
      : super(key: key);

  @override
  State<AgreementWidget> createState() => _AgreementWidgetState();
}

class _AgreementWidgetState extends State<AgreementWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          shape: const CircleBorder(),
          value: widget.checked,
          onChanged: widget.onChanged,
          focusColor: Colors.green,
          activeColor: Colors.green,
        ),
        RichText(
          text: TextSpan(
            text: '我已阅读并同意',
            style: const TextStyle(
                fontFamily: "MyFontStyle", color: Colors.black, fontSize: 18.0),
            children: <TextSpan>[
              TextSpan(
                text: ' 服务协议 ',
                style: const TextStyle(
                    fontFamily: "MyFontStyle", color: Colors.green),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Get.toNamed(
                      "/agreement",
                      arguments: {
                        "content": Markdowndata.agreementUser,
                        "title": " 服务协议"
                      },
                    );
                  },
              ),
              const TextSpan(text: '和'),
              TextSpan(
                text: ' 隐私政策',
                style: const TextStyle(
                    fontFamily: "MyFontStyle", color: Colors.green),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Get.toNamed(
                      "/agreement",
                      arguments: {
                        "content": Markdowndata.privacy,
                        "title": " 隐私政策"
                      },
                    );
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
