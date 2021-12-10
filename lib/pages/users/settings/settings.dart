import 'package:flutter/material.dart';
//import 'AccountSet.dart';
import '../../../widget/widgets.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    //double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '设置',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          //centerTitle: true,
        ),
        body: Column(
          children: [
            listtilebotton(
                bottomname: "个人信息",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
            listtilebotton(
                bottomname: "账号设置",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
            listtilebotton(
                bottomname: "软件升级",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
            listtilebotton(
                bottomname: "清理缓存",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
            listtilebotton(
                bottomname: "关于我们",
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  print("object");
                },
                context: context),
          ],
        ));
  }
} 
      
      
      
      
      
      
      
      
//       Stack(
//         children: [
//           Positioned(
//             top: 10,
//             left: 0,
//             child: Container(
//               width: screenwidth,
//               height: 240,
//               child: Column(
//                 children: [
//                   //“个人信息”栏
//                   Container(
//                     width: screenwidth,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 1,
//                           color: Colors.black26,
//                         ),
//                       ),
//                     ),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Stack(
//                         children: <Widget>[
//                           Positioned(
//                             left: 17,
//                             top: 3,
//                             child: Text(
//                               '个人信息',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 3,
//                             right: 7,
//                             child: Icon(
//                               Icons.keyboard_arrow_right,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //“账号设置”栏
//                   Container(
//                     width: screenwidth,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 1,
//                           color: Colors.black26,
//                         ),
//                       ),
//                     ),
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AccountSetPage(),
//                             ));
//                       },
//                       child: Stack(
//                         children: <Widget>[
//                           Positioned(
//                             left: 17,
//                             top: 3,
//                             child: Text(
//                               '账号设置',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 3,
//                             right: 7,
//                             child: Icon(
//                               Icons.keyboard_arrow_right,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //“软件升级”栏
//                   Container(
//                     width: screenwidth,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 1,
//                           color: Colors.black26,
//                         ),
//                       ),
//                     ),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Stack(
//                         children: <Widget>[
//                           Positioned(
//                             left: 17,
//                             top: 3,
//                             child: Text(
//                               '软件升级',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 3,
//                             right: 7,
//                             child: Icon(
//                               Icons.keyboard_arrow_right,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //“清理缓存”栏
//                   Container(
//                     width: screenwidth,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 1,
//                           color: Colors.black26,
//                         ),
//                       ),
//                     ),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Stack(
//                         children: <Widget>[
//                           Positioned(
//                             left: 17,
//                             top: 3,
//                             child: Text(
//                               '清理缓存',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 3,
//                             right: 7,
//                             child: Icon(
//                               Icons.keyboard_arrow_right,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //“关于我们”栏
//                   Container(
//                     width: screenwidth,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 1,
//                           color: Colors.black26,
//                         ),
//                       ),
//                     ),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Stack(
//                         children: <Widget>[
//                           Positioned(
//                             left: 17,
//                             top: 3,
//                             child: Text(
//                               '关于我们',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 3,
//                             right: 7,
//                             child: Icon(
//                               Icons.keyboard_arrow_right,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           //“退出登录”按钮
//           Positioned(
//             top: 280,
//             left: 0,
//             child: Container(
//               height: 50,
//               width: screenwidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     width: 0.5,
//                     color: Colors.black26,
//                   ),
//                   top: BorderSide(
//                     width: 0.5,
//                     color: Colors.black26,
//                   ),
//                 ),
//               ),
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   '退出登录',
//                   style: TextStyle(
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
