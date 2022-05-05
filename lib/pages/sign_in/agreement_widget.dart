import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/staticdata/makdowndata.dart';
import '../users/users_agreement.dart';

class AgreementWidget extends StatelessWidget {
  final bool agree;
  final Function onTap;

  const AgreementWidget({Key? key, required this.agree, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          shape: const CircleBorder(),
          value: agree,
          onChanged: (v) {
            onTap();
          },
        ),
        RichText(
          text: TextSpan(
            text: '我已阅读并同意',
            style: const TextStyle(
                color: Colors.black, fontSize: 13.0, fontFamily: "MyFontStyle"),
            children: <TextSpan>[
              TextSpan(
                text: '《服务协议》',
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Agreement(
                              data: Markdowndata.agreementUser,
                              title: '《服务协议》',
                            )));
                  },
              ),
              const TextSpan(text: '和'),
              TextSpan(
                  text: '《隐私政策》',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Agreement(
                                data: Markdowndata.privacy,
                                title: '《隐私政策》',
                              )));
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
