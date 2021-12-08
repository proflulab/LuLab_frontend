import 'package:flutter/material.dart';

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
        height: 70,
        width: 10,
        color: Colors.yellow,
        // decoration: BoxDecoration(
        //   color: Colors.lightBlueAccent,
        //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
        // ),
        child: Center(
          child: Text(
            '广告位',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
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
                onPressed: () {},
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
        margin: EdgeInsets.all(10),
        color: Colors.red,
        child: ListTile(
          leading: Icon(Icons.ac_unit),
          //selected:,
          title: Text("电话咨询"),
          contentPadding: EdgeInsets.all(0),
          trailing: Icon(Icons.arrow_right_alt_sharp),
          onTap: () {
            print("进入个人主页");
          },
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
                  //Navigator.pushNamed(context, '/history');
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

// Container(
//         height: screenheight,
//         width: screenwidth,
//         //设置渐变色
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.lightBlueAccent,
//               //Color.fromRGBO灰色前三个数值相等，一般设置128，第四位是透明度，在0~1之间
//               Color.fromRGBO(128, 128, 128, 0.05),
//             ],
//             //colors数组与stops数组一一对应，分别为两个颜色的起始点
//             stops: [0.0, 0.3],
//           ),
//         ),
//         child: Stack(
//           children: [
//             //此positioned用于存放头像及标识（姓名、身份）
//             Positioned(
//               top: 0,
//               left: 0,
//               child: Container(
//                 height: 120,
//                 width: 200,
//                 child: Stack(
//                   children: [
//                     //头像
//                     Positioned(
//                       top: 40,
//                       left: 30,
//  child: CircleAvatar(
//                         radius: 30.0,
//                         backgroundImage: NetworkImage(
//                             'https://huyaimg.msstatic.com/avatar/1083/5c/c50b386acc89c3b58dcf6225c4af0e_180_135.jpg'),
//                       ),
//                     ),
//                     //姓名
//                     Positioned(
//                       top: 50,
//                       left: 100,
//                       child: Text(
//                         '杨仕明',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     //身份
//                     Positioned(
//                       top: 70,
//                       left: 100,
//                       child: Text(
//                         '功勋学员/会员',
//                         style: TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //此positioned用于存放“设置”图标
//             Positioned(
//               top: 20,
//               right: 20,
//               child: IconButton(
//                 icon: Icon(Icons.settings),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SettingsPage(),
//                       ));
//                 },
//               ),
//             ),
//             //此positioned用于存放“个人主页”按钮
//             Positioned(
//               top: 70,
//               right: 10,
//               //用Container嵌套TextButton的意义在于可以更好地控制宽高布局（Container可以设置宽高）
//               child: Container(
//                 height: 40,
//                 width: 120,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 18,
//                         child: Text(
//                           '个人主页',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 5,
//                         child: Icon(
//                           Icons.keyboard_arrow_right,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             //此处用于存放动态、粉丝、关注、累计学习栏目
//             Positioned(
//               top: 120,
//               left: 10,
//               right: 10,
//               child: Container(
//                 height: 60,
//                 width: screenwidth,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ContactItem(
//                       count: '56',
//                       title: '动态',
//                       onPressed: () {},
//                     ),
//                     ContactItem(
//                       count: '78',
//                       title: '关注',
//                       onPressed: () {},
//                     ),
//                     ContactItem(
//                       count: '90',
//                       title: '粉丝',
//                       onPressed: () {},
//                     ),
//                     ContactItem(
//                       count: '12',
//                       title: '累计学习',
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //此positioned用于存放广告位
//             Positioned(
//               top: 180,
//               left: 10,
//               right: 10,
//               child: Container(
//                 height: 50,
//                 width: screenwidth,
//                 decoration: BoxDecoration(
//                   color: Colors.lightBlueAccent,
//                   borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '广告位',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ),
//             //此positioned用于存放任务图标（购买记录、离线课程等）
//             Positioned(
//               top: 240,
//               left: 10,
//               right: 10,
//               child: Container(
//                 height: 170,
//                 width: screenwidth,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                 ),
//                 child: Stack(
//                   children: [
//                     //“购买记录”图标
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       child: Container(
//                         width: 85,
//                         height: 85,
//                         child: TextButton(
//                           onPressed: () {},
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: 0,
//                                 left: 9,
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black12,
//                                     borderRadius: BorderRadius.circular(150),
//                                   ),
//                                   child: Icon(
//                                     Icons.assignment,
//                                     size: 36,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 50,
//                                 left: 7,
//                                 child: Text(
//                                   '购买记录',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     //“离线缓存”图标
//                     Positioned(
//                       top: 0,
//                       left: 85,
//                       child: Container(
//                         width: 85,
//                         height: 85,
//                         child: TextButton(
//                           onPressed: () {},
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: 0,
//                                 left: 9,
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black12,
//                                     borderRadius: BorderRadius.circular(150),
//                                   ),
//                                   child: Icon(
//                                     Icons.assignment_returned_outlined,
//                                     size: 36,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 50,
//                                 left: 7,
//                                 child: Text(
//                                   '离线缓存',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     //“我的收藏”图标
//                     Positioned(
//                       top: 0,
//                       left: 170,
//                       child: Container(
//                         width: 85,
//                         height: 85,
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => FavoritesPage(),
//                                 ));
//                           },
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: 0,
//                                 left: 9,
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black12,
//                                     borderRadius: BorderRadius.circular(150),
//                                   ),
//                                   child: Icon(
//                                     Icons.star_border,
//                                     size: 36,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 50,
//                                 left: 7,
//                                 child: Text(
//                                   '我的收藏',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     //“观看历史”图标
//                     Positioned(
//                       top: 0,
//                       left: 255,
//                       child: Container(
//                         width: 85,
//                         height: 85,
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => WatchHistory(),
//                                 ));
//                           },
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: 0,
//                                 left: 9,
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black12,
//                                     borderRadius: BorderRadius.circular(150),
//                                   ),
//                                   child: Icon(
//                                     Icons.query_builder,
//                                     size: 36,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 50,
//                                 left: 7,
//                                 child: Text(
//                                   '观看历史',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     //“意见反馈”图标
//                     Positioned(
//                       top: 85,
//                       left: 0,
//                       child: Container(
//                         width: 85,
//                         height: 85,
//                         child: TextButton(
//                           onPressed: () {},
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: 0,
//                                 left: 9,
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black12,
//                                     borderRadius: BorderRadius.circular(150),
//                                   ),
//                                   child: Icon(
//                                     Icons.announcement,
//                                     size: 36,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 50,
//                                 left: 7,
//                                 child: Text(
//                                   '意见反馈',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //此positioned用于存放任务栏（在线咨询、电话咨询）
//             Positioned(
//               top: 420,
//               left: 10,
//               right: 10,
//               child: Container(
//                 width: screenwidth,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                 ),
//                 child: Column(
//                   children: [
//                     //“在线咨询”任务栏
//                     Container(
//                       margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                       height: 45,
//                       width: 320,
//                       decoration: BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(
//                             width: 1,
//                             color: Colors.black26,
//                           ),
//                         ),
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => AdviceOnlinePage(),
//                               ));
//                         },
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: 5,
//                               left: 0,
//                               child: Icon(
//                                 Icons.headset,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Positioned(
//                                 top: 3,
//                                 left: 33,
//                                 child: Text(
//                                   '在线咨询',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                   ),
//                                 )),
//                             Positioned(
//                               top: 7,
//                               right: 3,
//                               child: Icon(
//                                 Icons.keyboard_arrow_right,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     //“电话咨询”任务栏
//                     Container(
//                       margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                       height: 45,
//                       width: 320,
//                       decoration: BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(
//                             width: 1,
//                             color: Colors.black26,
//                           ),
//                         ),
//                       ),
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: 5,
//                               left: 0,
//                               child: Icon(
//                                 Icons.phone_in_talk,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Positioned(
//                                 top: 5,
//                                 left: 33,
//                                 child: Text(
//                                   '电话咨询',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                   ),
//                                 )),
//                             Positioned(
//                               top: 7,
//                               right: 3,
//                               child: Icon(
//                                 Icons.keyboard_arrow_right,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
