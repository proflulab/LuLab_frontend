import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proflu/common/utils/screen.dart';
import 'package:proflu/pages/users/users_agreement.dart';

import '../../../common/values/values.dart';
import '../../../common/widget/widgets.dart';
//import '../../../common/utils/utils.dart';
import '../../common/staticdata/staticdata.dart';

class SetAbout extends StatelessWidget {
  const SetAbout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text('关于实验室',
            style: TextStyle(fontFamily: 'MyFontStyle', color: Colors.black)),
      ),
      body: const Ttt(),
    );
  }
}

class Ttt extends StatelessWidget {
  const Ttt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset("assets/images/logo.svg"),
        Container(
          margin: EdgeInsets.all(PFspace.screenMargin),
          padding: EdgeInsets.all(PFspace.screenMargin),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            children: [
              listtilebotton2(
                  bottomname: "服务协议",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Agreement(
                              data: Markdowndata.agreementUser,
                              title: '服务协议',
                            )));
                  },
                  context: context),
              const Divider(height: 1),
              listtilebotton2(
                  bottomname: "隐私政策",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Agreement(
                              data: Markdowndata.privacy,
                              title: '隐私政策',
                            )));
                  },
                  context: context),
              // const Divider(),
              // listtilebotton2(
              //     bottomname: "产品特色",
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => const Agreement(
              //                 data: Markdowndata.agreementUser,
              //                 title: '产品特色',
              //               )));
              //     },
              //     context: context),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(PFspace.screenMargin),
          padding: EdgeInsets.all(PFspace.screenMargin),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 60.w,
                  alignment: Alignment.centerLeft,
                  child: PFtext.text1(text: "产品特色")),
              const Divider(),
              PFtext.text3(text: Markdowndata.characteristic, maxLines: 99)
            ],
          ),
        )
      ],
    );
  }
}
