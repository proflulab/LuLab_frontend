import 'package:flutter/material.dart';

import '../users_set.dart';
import 'users_copyright_user.dart';
import 'users_product_user.dart';
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
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text('关于实验室', style: TextStyle(color: Colors.black)),
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
    return Container(
      color: const Color.fromRGBO(246, 246, 246, 1),
      child: Column(children: [
        Image.asset(
          'assets/images/OIP-TY.jpg',
          fit: BoxFit.fill,
          width: 359,
          height: 240,
        ),
        Container(
            width: 330,
            height: 178,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('服务使用协议'),
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.black54),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Service()));
                  },
                ),
                Container(
                  color: const Color.fromRGBO(227, 227, 227, 1),
                  height: 2,
                ),
                ListTile(
                  title: const Text('隐私政策'),
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.black54),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Qrivacy(title: '我是跳转传值')));
                  },
                ),
                Container(
                  color: const Color.fromRGBO(227, 227, 227, 1),
                  height: 2,
                ),
                ListTile(
                  title: const Text('版权声明'),
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.black54),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const Copyright(title: '我是跳转传值')));
                  },
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(227, 227, 227, 1),
              ),
            )),
        Container(
          height: 30,
        ),
        Container(
            height: 60,
            width: 330,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Qroduct()));
                },
                // padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                    ),
                    const Text(
                      '产品特色',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Container(
                      width: 210,
                    ),
                    const Icon(Icons.chevron_right, color: Colors.black54),
                  ],
                )

                // padding: EdgeInsets.zero,
                ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(227, 227, 227, 1),
              ),
            ))
      ]),
    );
  }
}
