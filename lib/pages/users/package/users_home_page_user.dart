import 'package:flutter/material.dart';

import '../../../common/values/values.dart';
import '../../../common/widget/widgets.dart';
//import '../../../common/utils/utils.dart';

import '../users_set.dart';
import 'users_copyright_user.dart';
import 'users_features_user.dart';
import 'users_service_user.dart';
import 'users_privacy_user.dart';

class Dty extends StatelessWidget {
  const Dty({
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
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
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
        Image.asset(
          'assets/images/OIP-YYH.jpg',
          fit: BoxFit.fill,
          width: 359,
          height: 210,
        ),
        Container(
          margin: EdgeInsets.all(PFspace.screenMargin),
          padding: EdgeInsets.all(PFspace.screenMargin),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            children: [
              listtilebotton2(
                  bottomname: "服务使用协议",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Service()));
                  },
                  context: context),
              const Divider(),
              listtilebotton2(
                  bottomname: "隐私政策",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Qrivacy(title: '我是跳转传值')));
                  },
                  context: context),
              const Divider(),
              listtilebotton2(
                  bottomname: "版权声明",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const Copyright(title: '我是跳转传值')));
                  },
                  context: context),
              const Divider(),
              listtilebotton2(
                  bottomname: "产品特色",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Features()));
                  },
                  context: context),
            ],
          ),
        ),
      ],
    );
  }
}
