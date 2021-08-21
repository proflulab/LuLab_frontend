import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'contact_item.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的"),
        ),
        body: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final double _appBarHeight = 180.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: new FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Expanded(
                        flex: 1,
                        child: new Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                          ),
                          child: new CircleAvatar(
                            radius: 40.0,
                            backgroundImage: new NetworkImage(
                                'https://huyaimg.msstatic.com/avatar/1083/5c/c50b386acc89c3b58dcf6225c4af0e_180_135.jpg'),
                          ),
                        ),
                      ),
                      new Expanded(
                        flex: 3,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 20.0,
                                bottom: 10.0,
                              ),
                              child: new Text(
                                '杨仕明',
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: new Text(
                                '功勋学员/会员',
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                new Container(
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new ContactItem(
                          count: '999',
                          title: '动态',
                          onPressed: () {},
                        ),
                        new ContactItem(
                          count: '999',
                          title: '关注',
                          onPressed: () {},
                        ),
                        new ContactItem(
                          count: '999',
                          title: '粉丝',
                          onPressed: () {},
                        ),
                        new ContactItem(
                          count: '999分钟',
                          title: '今日学习',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 2.0),
                  child: Column(
                    children: <Widget>[
                      new MenuItem(
                        icon: Icons.face,
                        title: '我的收藏',
                        onPressed: () {
                          print("我的收藏  ----   >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '我的创作',
                        onPressed: () {
                          print("我的创作  ----   >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '我赞过的',
                        onPressed: () {
                          print("我赞过的  ----   >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.message,
                        title: '我的消息',
                        onPressed: () {
                          print("我的消息  ----   >");
                        },
                      ),
                    ],
                  ),
                ),
                new Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: <Widget>[
                      new MenuItem(
                        icon: Icons.face,
                        title: '我的钱包',
                        onPressed: () {
                          print("我的钱包  ----   >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.print,
                        title: '我的订单',
                        onPressed: () {
                          print("我的订单  ----   >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.archive,
                        title: '我的评价',
                        onPressed: () {
                          print("我的评价  ----  >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.archive,
                        title: '帮助与反馈',
                        onPressed: () {
                          print("帮助与反馈  ----  >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.archive,
                        title: '设置',
                        onPressed: () {
                          print("设置  ----  >");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
