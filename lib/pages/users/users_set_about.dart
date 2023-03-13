import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';
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
        SizedBox(height: 80.h,),
        SvgPicture.asset("assets/images/logo.svg"),
        SizedBox(height: 30.h,),
        SvgPicture.asset("assets/images/proflu_text.svg"),
        SizedBox(height: 50.h,),
        Container(
          margin: EdgeInsets.all(PFspace.screenMargin),
          //padding: EdgeInsets.all(PFspace.screenMargin),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: PFRadius.a15),
          child: Column(
            children: [
              lineWidget2(
                  title: "官方微信",
                  dsc:"wechat",
              ),
              Divider(height: 1, indent: 30.w, endIndent: 30.w),
              lineWidget2(
                title: "官方邮箱",
                dsc:"XXXX@proflu.com",
              ),
              Divider(height: 1, indent: 30.w, endIndent: 30.w),
              lineWidget(
                  title: "服务协议",
                  onTap: () {
                    Get.toNamed(
                      "/agreement",
                      arguments: {
                        "content": Markdowndata.agreementUser,
                        "title": "《服务协议》"
                      },
                    );
                  }),
              Divider(height: 1, indent: 30.w, endIndent: 30.w),
              lineWidget(
                  title: "隐私政策",
                  onTap: () {
                    Get.toNamed(
                      "/agreement",
                      arguments: {
                        "content": Markdowndata.privacy,
                        "title": "《隐私政策》"
                      },
                    );
                  }),
              Divider(height: 1, indent: 30.w, endIndent: 30.w),
              lineWidget(
                  title: "版权声明",
                  onTap: () {
                    Get.toNamed(
                      "/agreement",
                      arguments: {
                        "content": Markdowndata.agreementUser,
                        "title": "《服务协议》"
                      },
                    );
                  }),
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
        // Container(
        //   margin: EdgeInsets.all(PFspace.screenMargin),
        //   padding: EdgeInsets.all(PFspace.screenMargin),
        //   decoration:
        //       BoxDecoration(color: Colors.white, borderRadius: PFRadius.a15),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //           height: 60.w,
        //           alignment: Alignment.center,
        //           child: PFtext.text1(text: "产品特色")),
        //       Container(
        //           height: 60.w,
        //           alignment: Alignment.center,
        //           child: PFtext.text1(text: "产品特色")),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
