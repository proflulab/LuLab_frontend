import 'package:flutter/material.dart';
import 'settings/settings.dart';

// import './favorites/MyFavorites.dart';
// import './settings/settings.dart';
//import './history/history.dart';
//import './advice_online/AdviceOnline.dart';
import '../../widget/widgets.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度、高度
    double screenwidth = MediaQuery.of(context).size.width;
    //double screenheight = MediaQuery.of(context).size.height;

//个人头像，姓名，等级
    Widget _username() {
      return Container(
        //height: 100,
        margin: EdgeInsets.all(10),
        //color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/logo.png"),
          ),
          title: Text("某某某"),
          subtitle: Text("功勋学员"),
          contentPadding: EdgeInsets.all(10),
          trailing: Text("个人主页"),
          onTap: () {
            print("进入个人主页");
          },
        ),
      );
    }

    Widget _dynamicdata() {
      return Container(
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
              count: '12',
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
        padding: EdgeInsets.only(left: 15, right: 5),
        margin: EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.green),
        child: Center(
          child: ListTile(
            title: Text("VIP"),
            subtitle: Text("优享&大特权"),
            contentPadding: EdgeInsets.all(10),
            trailing: Chip(
              avatar: null,
              label: Text("立即加入"),
            ),

            //
            onTap: () {
              print("进入会员详情");
            },
          ),
        ),
      );
    }

    Widget _jumpbutton() {
      return Container(
        height: 250,
        //padding: EdgeInsets.only(left: 5, right: 5),
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: GridView.count(
          crossAxisCount: 4,
          children: [
            combotton(
                bottomname: " 购买记录",
                icon: Icon(Icons.account_box_sharp),
                onPressed: () {
                  print("跳转到购买记录");
                },
                context: context),
            combotton(
                bottomname: " 离线课程",
                icon: Icon(Icons.ac_unit),
                onPressed: () {},
                context: context),
            combotton(
                bottomname: " 我的收藏",
                icon: Icon(Icons.ac_unit),
                onPressed: () {},
                context: context),
            combotton(
                bottomname: " 观看历史",
                icon: Icon(Icons.ac_unit),
                onPressed: () {},
                context: context),
            combotton(
                bottomname: " 购买记录",
                icon: Icon(Icons.ac_unit),
                onPressed: () {},
                context: context),
          ],
        ),
      );
    }

    Widget _contact() {
      return Container(
        height: 280,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Column(
          children: [
            listtilebotton(
                bottomname: "电话咨询",
                icon: Icon(Icons.ac_unit),
                onPressed: () {},
                context: context),
            Divider(),
            listtilebotton(
                bottomname: "在线咨询",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
            Divider(),
            listtilebotton(
                bottomname: "帮助中心",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
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
                  print("跳转到设置");
                  //Navigator.pushNamed(context, '/setting');
                  //Navigator.pushNamed(context, '/set');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                icon: Icon(
                  Icons.settings,
                  //color: Color.fromRGBO(117, 117, 117, 1),
                ))
          ],
          leading: IconButton(
            icon: Icon(Icons.headset_mic,
                color: Color.fromRGBO(117, 117, 117, 1)),
            onPressed: () {
              print("扫码");
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
            Divider(),
            _contact(),
          ],
        ));
  }
}
