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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          shape: const CircleBorder(),
          value: widget.checked,
          onChanged: widget.onChanged,
          focusColor: PFc.themeColor,
          activeColor: PFc.themeColor,
        ),
        RichText(
          text: TextSpan(
            text: '我已阅读并同意',
            style: const TextStyle(color: Colors.black, fontSize: 13.0),
            children: <TextSpan>[
              TextSpan(
                text: '《服务协议》',
                style: const TextStyle(color: PFc.themeColor),
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
                style: const TextStyle(color: PFc.themeColor),
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
      ],
    );
  }
}
