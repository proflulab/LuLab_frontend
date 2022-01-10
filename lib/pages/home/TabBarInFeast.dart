import 'package:flutter/material.dart';

import '../../widget/widgets.dart';

class AppBardemoPage extends StatelessWidget {
  const AppBardemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: const <Widget>[
        Positioned(
          top: 10.0,
          left: 15.0,
          child: CircleAvatar(
            //底层的组件
            backgroundImage: NetworkImage(
                'https://up.enterdesk.com/edpic/f9/50/b0/f950b0aa078f3a0be7ba87f46a43705a.jpg'),
            radius: 22.5, //参数
          ),
        ),
        Positioned(
          top: 12.0,
          left: 70.0,
          child: SizedBox(
            width: 80.0, //容器的相关参数
            height: 30.0,
            // color: Colors.green,
            child: Text(
              '昵称',
              style: TextStyle(
                //文本的相关参数
                fontFamily: 'MyFontStyle',
                fontSize: 15.0,
                color: Colors.black,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ),
        Positioned(
          top: 35.0,
          left: 70.0,
          child: SizedBox(
            width: 68.0, //容器的相关参数
            height: 18.0,
            // color: Colors.green,
            child: Text(
              '2021-10-10',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Positioned(
          top: 65.0,
          left: 15.0,
          child: SizedBox(
            width: 380.0, //容器的相关参数
            height: 120.0,
            // color: Colors.green,
            child: Text(
              '介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍',
              style: TextStyle(
                //文本的相关参数
                fontFamily: 'MyFontStyle',
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          top: 120.0,
          left: 15.0,
          child: SizedBox(
            width: 150.0, //容器的相关参数
            height: 200.0,
            // color: Colors.green,
            child: VideoView(
              // widget.product.videoUrl,
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              cover:
                  'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
            ),
            // Image.asset('assets/images/fenmian.jpg', fit: BoxFit.fill)
          ),
        ),
      ],
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.white,
              title: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Text(''),
              ),
              bottom: const TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 1,
                  isScrollable: false,
                  labelStyle: TextStyle(fontSize: 20),
                  tabs: <Widget>[
                    Tab(
                      text: "动态",
                    ),
                    Tab(text: "培养方案")
                  ]),
            ),
            preferredSize: const Size.fromHeight(60.0)),
        body: TabBarView(
          children: <Widget>[
            //利用Builder
            ListView(
              children: <Widget>[
                Container(
                  width: 375.0,
                  height: 380.0,
                  color: Colors.white,
                  child: stack,
                ),
                Container(
                  width: 375.0,
                  height: 380.0,
                  color: Colors.white,
                  child: stack,
                ),
              ],
            ),
            ListView(
              children: const <Widget>[
                ListTile(title: Text("这是第二个 tab")),
                ListTile(title: Text("这是第二个 tab")),
                ListTile(title: Text("这是第二个 tab"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class TabBarView extends StatelessWidget {
//   final tabs = <Tab>[
//     Tab(
//       text: '第一页',
//     ),
//     Tab(
//       icon: Icon(Icons.add_alert_rounded),
//     ),
//     Tab(
//       icon: Icon(Icons.accessibility_rounded),
//     )
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: tabs.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('TabBar'),
//           bottom: TabBar(
//             tabs: tabs,
//           ),
//         ),
//         body: TabBarView(
//             children:[
//           Icon(Icons.supervised_user_circle_rounded),
//           Icon(Icons.add_alert_rounded),
//           Icon(Icons.accessibility_rounded),
//         ]),
//       ),
//     );
//   }
// }

// class TabControllerDemo extends StatefulWidget {
//   TabControllerDemo({Key ? key}) : super(key: key);
//
//   _TabControllerDemoState createState() => _TabControllerDemoState();
// }
//
// class _TabControllerDemoState extends State<TabControllerDemo>  with SingleTickerProviderStateMixin {
//   final TabController controller;
//   TabController _tabController;
//   this._tabController = new TabController(vsync: this, length: 5);
//   this._tabController.addListener(() {
//   print(this._tabController.toString());
//   print(this._tabController.index);
//   print(this._tabController.length);
//   print(this._tabController.previousIndex);
//   });
//
//   @override
//   void initState() {
//     super.initState();
//     this._tabController = new TabController(vsync: this, length: 5);
//     this._tabController.addListener(() {
//       print(this._tabController.toString());
//       print(this._tabController.index);
//       print(this._tabController.length);
//       print(this._tabController.previousIndex);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: TabBar(
//             controller: this._tabController,
//             tabs: <Widget>[
//               Tab(text: '女装'),
//               Tab(text: '男装'),
//               Tab(text: '童装'),
//               Tab(text: '夏装'),
//               Tab(text: '冬装'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: this._tabController,
//           children: <Widget>[
//             ListViewContnet(),
//             ListViewContnet(),
//             ListViewContnet(),
//             ListViewContnet(),
//             ListViewContnet(),
//           ],
//         ));
//   }
// }

// class StateFulWidgetDemo1 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => StateFulWidgetDemo1State();
//
// }
//
// class StateFulWidgetDemo1State extends State<StateFulWidgetDemo1>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   void initState() {
//     super.initState();
//     _tabController = new TabController(vsync: this, length: 3);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('顶部tab切换'),
//         bottom: new TabBar(
//           tabs: <Widget>[
//             new Tab(
//               icon: new Icon(Icons.directions_bike),
//             ),
//             new Tab(
//               icon: new Icon(Icons.directions_boat),
//             ),
//             new Tab(
//               icon: new Icon(Icons.directions_bus),
//             ),
//           ],
//           controller: _tabController,
//         ),
//       ),
//       body: new TabBarView(
//         controller: _tabController,
//         children: <Widget>[
//           new Center(child: new Text('自行车')),
//           new Center(child: new Text('船')),
//           new Center(child: new Text('巴士')),
//         ],
//       ),
//     );
//   }
