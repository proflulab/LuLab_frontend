import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'contact_item.dart';
import 'settings.dart';
import 'support.dart';
import 'create.dart';
import 'like.dart';
import 'favorites.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
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
    //获取屏幕宽度
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                          ),
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(
                                'https://huyaimg.msstatic.com/avatar/1083/5c/c50b386acc89c3b58dcf6225c4af0e_180_135.jpg'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 20.0,
                                bottom: 10.0,
                              ),
                              child: Text(
                                '杨仕明',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Text(
                                '功勋学员/会员',
                                style: TextStyle(
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
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ContactItem(
                          count: '999',
                          title: '动态',
                          onPressed: () {},
                        ),
                        ContactItem(
                          count: '999',
                          title: '关注',
                          onPressed: () {},
                        ),
                        ContactItem(
                          count: '999',
                          title: '粉丝',
                          onPressed: () {},
                        ),
                        ContactItem(
                          count: '999分钟',
                          title: '今日学习',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 2.0),
                  child: Column(
                    children: <Widget>[
                      MenuItem(
                        icon: Icons.face,
                        title: '我的收藏',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavoritesPage(),
                              ));
                        },
                      ),
                      MenuItem(
                        icon: Icons.face,
                        title: '我的创作',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreatePage(),
                              ));
                        },
                      ),
                      MenuItem(
                        icon: Icons.face,
                        title: '我赞过的',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LikePage(),
                              ));
                        },
                      ),
                      MenuItem(
                        icon: Icons.message,
                        title: '我的消息',
                        onPressed: () {
                          print(screenheight);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: <Widget>[
                      MenuItem(
                        icon: Icons.face,
                        title: '我的钱包',
                        onPressed: () {
                          print("我的钱包  ----   >");
                        },
                      ),
                      MenuItem(
                        icon: Icons.print,
                        title: '我的订单',
                        onPressed: () {
                          print("我的订单  ----   >");
                        },
                      ),
                      MenuItem(
                        icon: Icons.archive,
                        title: '我的评价',
                        onPressed: () {
                          print("我的评价  ----  >");
                        },
                      ),
                      MenuItem(
                        icon: Icons.archive,
                        title: '帮助与反馈',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SupportPage(),
                              ));
                        },
                      ),
                      MenuItem(
                        icon: Icons.archive,
                        title: '设置',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ));
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
