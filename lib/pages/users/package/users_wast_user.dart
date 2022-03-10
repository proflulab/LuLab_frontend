import 'package:flutter/material.dart';
// import 'tttt/dtys.dart';
import '../users_set.dart';
import 'users_dart_user.dart';
import 'users_sat_user.dart';
import 'users_tst_user.dart';

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
          // padding: EdgeInsets.all(10),
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
  const Ttt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset('assets/images/OIP-TV.jpg'),
        const ListTile(
          title: Text('官方微信号'),
          trailing: Text('GDFHFGJHG'),
        ),
        Container(
          color: const Color.fromRGBO(227, 227, 227, 1),
          height: 2,
        ),
        const ListTile(
          title: Text('官方邮箱'),
          trailing: Text('srs@RRRR.Ttyjg'),
        ),
        Container(
          color: const Color.fromRGBO(227, 227, 227, 1),
          height: 2,
        ),
        ListTile(
          title: const Text('服务使用协议'),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Dwwww()));
          },
        ),
        Container(
          color: const Color.fromRGBO(227, 227, 227, 1),
          height: 2,
        ),
        ListTile(
          title: const Text('隐私政策'),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Dddg(title: '我是跳转传值')));
          },
        ),
        Container(
          color: const Color.fromRGBO(227, 227, 227, 1),
          height: 2,
        ),
        ListTile(
          title: const Text('版权声明'),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Ff(title: '我是跳转传值')));
          },
        ),
        Container(
          color: const Color.fromRGBO(227, 227, 227, 1),
          height: 2,
        ),
        Container(
          color: const Color.fromRGBO(227, 227, 227, 1),
          alignment: Alignment.center,
          height: 125,
          child: const Text('陆向谦创新创业实验室'),
        ),
      ],
    );
  }
}
