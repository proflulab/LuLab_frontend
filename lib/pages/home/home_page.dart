import 'package:flutter/material.dart';
import 'package:proflu/common/values/values.dart';

import 'home_feats.dart';
import 'home_gather.dart';
import 'home_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const HomePageList(),
        appBar: PreferredSize(
            //设置appBar高度
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              automaticallyImplyLeading: false,
              //由主题统一配色，不在这里重新设定颜色
              backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
              bottom: const TabBar(
                  tabs: [
                    Tab(text: "推荐区"),
                    Tab(text: "功勋园"),
                    Tab(text: "训练营"),
                  ],
                  //文字选中颜色
                  labelColor: ProfluC.themeColor,
                  //文字未选中颜色
                  unselectedLabelColor: Color.fromRGBO(154, 167, 177, 1),
                  //文字选中样式
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MyFontStyle',
                    fontSize: 25,
                  ),
                  //文字未选中样式
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    //fontFamily: 'MyFontStyle2',
                    fontSize: 15,
                  ),
                  //设置线条的颜色
                  indicatorColor: ProfluC.themeColor,
                  //设置线条的粗细
                  indicatorWeight: 4,
                  indicatorPadding:
                      EdgeInsets.only(right: 40, left: 40, bottom: 3)),
              // title: Text(
              //   '首页',
              //   style: TextStyle(
              //     fontFamily: 'MyFontStyle',
              //     color: Colors.green,
              //     fontSize: 24,
              //   ),
              // ),
              // centerTitle: true,
              // title: Padding(
              //   padding: const EdgeInsets.only(top: 2, bottom: 2, left: 16),
              //   child: Container(
              //     height: 35,
              //     width: MediaQuery.of(context).size.width - 64,
              //     decoration: BoxDecoration(
              //         color: const Color.fromRGBO(230, 230, 230, 1.0),
              //         borderRadius: BorderRadius.circular(20)),
              //     child: InkWell(
              //       child: Row(
              //         children: const <Widget>[
              //           Padding(
              //               padding: EdgeInsets.only(left: 10, right: 10),
              //               child: Icon(Icons.search, color: Colors.teal)),
              //           Text(
              //             "点我进行搜索",
              //             style: TextStyle(color: Colors.grey, fontSize: 15),
              //           )
              //         ],
              //       ),
              //       onTap: () {
              //         //这里是跳转搜索界面的关键
              //         showSearch(
              //             context: context, delegate: SearchBarDelegate());
              //       },
              //     ),
              //   ),
              // )
              // InkWell(
              //   //onTap是点击事件回调
              //   onTap: () {
              //     Navigator.pushNamed(context, '/search');
              //   },
              //
              //   child: Container(
              //     height: 30.0,
              //     padding: const EdgeInsets.only(left: 15),
              //     decoration: BoxDecoration(
              //         //改变搜索外框颜色
              //         //border: Border.all(color: Colors.black),
              //         color: const Color.fromRGBO(230, 230, 230, 0.8),
              //         borderRadius: BorderRadius.circular(15)),
              //     child: Row(children: const <Widget>[
              //       Icon(
              //         Icons.search,
              //         color: (Color.fromRGBO(154, 167, 177, 1)),
              //       ),
              //       Text(
              //         "   开始搜索",
              //         //textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Color.fromRGBO(154, 167, 177, 1),
              //           fontSize: 15,
              //         ),
              //       )
              //     ]),
              //   ),
              // ),
              //客服邮件功能
              // leading: IconButton(
              //   icon: const Icon(Icons.headset_mic,
              //       color: Color.fromRGBO(117, 117, 117, 1)),
              //   //如果没有onPressed会报错
              //   onPressed: () {
              //     if (kDebugMode) {
              //       print("跳转到客服");
              //     }
              //     Navigator.pushNamed(context, '/customer');
              //   },
              // ),
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         if (kDebugMode) {
              //           print("我收到的信息");
              //         }
              //         Navigator.pushNamed(context, '/message');
              //       },
              //       icon: const Icon(
              //         Icons.mail,
              //         color: Color.fromRGBO(117, 117, 117, 1),
              //       ))
              // ],
            )),
      ),
    );
  }
}

class HomePageList extends StatefulWidget {
  const HomePageList({Key? key}) : super(key: key);

  @override
  _HomePageListState createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Center(child: Gather()),
        Center(child: FeatsPage()),
        Center(child: DemoApp())
      ],
    );
  }
}
