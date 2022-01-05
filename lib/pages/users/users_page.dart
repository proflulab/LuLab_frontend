import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widget/widgets.dart';
import '../../values/myicon.dart';
import '../../global.dart';
import 'users_set.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
//print(profile.data.img);
    //获取屏幕宽度、高度
    double screenwidth = MediaQuery.of(context).size.width;
    //double screenheight = MediaQuery.of(context).size.height;

//个人头像，姓名，等级
    Widget _username() {
      return Container(
        //height: 100,
        margin: const EdgeInsets.all(20),
        //color: Colors.white,
        child: ListTile(
          leading: ClipOval(child: Image.network(Global.profile.data.img)),
          // CircleAvatar(
          //   radius: 25,
          //   backgroundImage: AssetImage("assets/images/logo.png"),
          // ),
          title: Text(Global.profile.data.name),
          subtitle: const Text("功勋学员"),
          contentPadding: const EdgeInsets.all(10),
          trailing: const Text("个人主页"),
          onTap: () {
            if (kDebugMode) {
              print("进入个人主页");
            }
          },
        ),
      );
    }

    Widget _dynamicdata() {
      return SizedBox(
        height: 60,
        width: screenwidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ContactItem(
              count: '56',
              title: '动态',
              onPressed: () {},
            ),
            ContactItem(
              count: '78',
              title: '关注',
              onPressed: () {},
            ),
            ContactItem(
              count: '90',
              title: '粉丝',
              onPressed: () {},
            ),
            ContactItem(
              count: '12min',
              title: '累计学习',
              onPressed: () {},
            ),
          ],
        ),
      );
    }

    Widget _adv() {
      return Container(
        height: 90,
        padding: const EdgeInsets.only(left: 15, right: 5),
        margin: const EdgeInsets.only(left: 30, right: 30),
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.green),
        child: Center(
          child: ListTile(
            title: const Text("VIP"),
            subtitle: const Text("优享&大特权"),
            contentPadding: const EdgeInsets.all(10),
            trailing: const Chip(
              avatar: null,
              label: Text("立即加入"),
            ),
            onTap: () {
              if (kDebugMode) {
                print("进入会员详情");
              }
            },
          ),
        ),
      );
    }

    Widget _jumpbutton() {
      return Container(
        height: 250,
        width: 500,
        //padding: EdgeInsets.only(left: 5, right: 5),
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Wrap(
          spacing: 0, // 主轴(水平)方向间距
          runSpacing: 20,
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          verticalDirection: VerticalDirection.down,
          children: [
            combotton(
                bottomname: " 购买记录",
                icon: const Icon(
                  MyIcon.userBuy,
                  size: 40,
                  color: Colors.red,
                ),
                onPressed: () {
                  if (kDebugMode) {
                    print("跳转到购买记录");
                  }
                },
                context: context),
            combotton(
                bottomname: "离线课程",
                icon: const Icon(
                  MyIcon.userDownload,
                  size: 40,
                  color: Colors.red,
                ),
                onPressed: () {},
                context: context),
            combotton(
                bottomname: "我的收藏",
                icon: const Icon(
                  MyIcon.userCollect,
                  size: 40,
                  color: Colors.red,
                ),
                onPressed: () {},
                context: context),
            combotton(
                bottomname: "观看历史",
                icon: const Icon(
                  MyIcon.userHistory,
                  size: 40,
                  color: Colors.red,
                ),
                onPressed: () {},
                context: context),
            combotton(
                bottomname: "我的会员",
                icon: const Icon(
                  MyIcon.userVip,
                  size: 40,
                  color: Colors.red,
                ),
                onPressed: () {},
                context: context),
          ],
        ),
      );
    }

    Widget _contact() {
      return Container(
        height: 290,
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: [
            const SizedBox(height: 10),
            listtilebotton(
                bottomname: "电话咨询",
                icon: const Icon(
                  MyIcon.userPhone,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: () {},
                context: context),
            const Divider(),
            listtilebotton(
                bottomname: "在线咨询",
                icon: const Icon(
                  MyIcon.userOnline,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: () {
                  if (kDebugMode) {
                    print("object");
                  }
                },
                context: context),
            const Divider(),
            listtilebotton(
                bottomname: "帮助中心",
                icon: const Icon(
                  MyIcon.userHelp,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: () {
                  if (kDebugMode) {
                    print("object");
                  }
                },
                context: context),
            const Divider(),
            listtilebotton(
                bottomname: "商务合作",
                icon: const Icon(
                  MyIcon.userCooperation,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: () {
                  if (kDebugMode) {
                    print("object");
                  }
                },
                context: context)
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Color.fromRGBO(14, 14, 31, 1),
          //backgroundColor: Colors.transparent,
          //elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("跳转到设置");
                  }

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
                icon: const Icon(
                  Icons.settings,
                  //color: Color.fromRGBO(117, 117, 117, 1),
                ))
          ],
          leading: IconButton(
            icon: const Icon(Icons.headset_mic,
                color: Color.fromRGBO(117, 117, 117, 1)),
            onPressed: () {
              if (kDebugMode) {
                print("扫码");
              }
              Navigator.pushNamed(context, '/customer');
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            _username(),
            _dynamicdata(),
            _adv(),
            _jumpbutton(),
            const Divider(),
            _contact(),
          ],
        ));
  }
}
