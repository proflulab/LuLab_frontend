import 'package:flutter/material.dart';

//import 'services/screenAdapter.dart';
var nameList = ["绿皮南瓜", "番茄", "白菜", "胡萝卜", "土豆", "甜菜", "白甜"];
late bool flag; //判断搜索框内输入的内容是否存在于数据列表里

const recentSuggest = [
  '推荐-1',
  '推荐-2',
];

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //var _keywords;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     child: TextField(
      //       autofocus: true,
      //       decoration: InputDecoration(
      //           border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(40),
      //               borderSide: BorderSide.none)),
      //       onChanged: (value) {
      //         //this._keywords = value;
      //       },
      //     ),
      //     height: 30,
      //     decoration: BoxDecoration(
      //         color: const Color.fromRGBO(233, 233, 233, 0.8),
      //         borderRadius: BorderRadius.circular(15)),
      //   ),
      //   actions: <Widget>[
      //     InkWell(
      //       child: SizedBox(
      //         // height: ScreenAdapter.height(68),
      //         // width: ScreenAdapter.width(80),
      //         height: 40,
      //         width: 50,
      //         child: Row(
      //           children: const <Widget>[Text("搜索")],
      //         ),
      //       ),
      //       onTap: () {
      //         if (kDebugMode) {
      //           print("开始搜索");
      //         }
      //         // Navigator.pushReplacementNamed(context, '/productList',
      //         //     arguments: {"keywords": this._keywords});
      //       },
      //     )
      //   ],
      // ),
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 16),
        child: Container(
          height: 35,
          width: MediaQuery.of(context).size.width - 64,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(230, 230, 230, 1.0),
              borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            child: Row(
              children: const <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(Icons.search, color: Colors.teal)),
                Text(
                  "点我进行搜索",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
            onTap: () {
              //这里是跳转搜索界面的关键
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ),
      )),
      // body: Container(
      //   padding: const EdgeInsets.all(10),
      //   child: ListView(
      //     children: <Widget>[
      //       Text("热搜", style: Theme.of(context).textTheme.headline5),
      //       const Divider(),
      //       Wrap(
      //         children: <Widget>[
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: const Color.fromRGBO(200, 233, 233, 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: const Text("理论"),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: const Color.fromRGBO(200, 233, 233, 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: const Text("创新"),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: const Color.fromRGBO(200, 233, 233, 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: const Text("颠覆"),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: const Color.fromRGBO(200, 233, 233, 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: const Text("学习"),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: const Color.fromRGBO(200, 233, 233, 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: const Text("案例"),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: const Color.fromRGBO(200, 233, 233, 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: const Text("案例"),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: const Color.fromRGBO(200, 233, 233, 1),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: const Text("案例"),
      //           )
      //         ],
      //       ),
      //       const SizedBox(height: 10),
      //       Text("历史记录", style: Theme.of(context).textTheme.headline5),
      //       const Divider(),
      //       Column(
      //         children: const <Widget>[
      //           ListTile(
      //             title: Text("理论"),
      //           ),
      //           Divider(),
      //           ListTile(
      //             title: Text("创新"),
      //           ),
      //           Divider(),
      //           ListTile(
      //             title: Text("案例"),
      //           ),
      //           Divider(),
      //           ListTile(
      //             title: Text("颠覆"),
      //           ),
      //           Divider(),
      //           ListTile(
      //             title: Text("学习"),
      //           ),
      //           Divider(),
      //         ],
      //       ),
      //       const SizedBox(height: 100),
      //       InkWell(
      //         onTap: () {},
      //         child: Container(
      //           width: 100,
      //           height: 40,
      //           decoration: BoxDecoration(
      //             border: Border.all(color: Colors.black45, width: 1),
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: const <Widget>[
      //               Icon(Icons.delete),
      //               Text("清空历史记录")
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // )
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  //返回值为我们搜索框右侧的一个控件
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        }, //搜索值为空
      )
    ];
  }

  //返回值为我们搜索框左侧的一个控件
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, 'null') //点击时关闭整个搜索页面
        );
  }

  //返回值为我们搜到内容后的展现
  @override
  Widget buildResults(BuildContext context) {
    for (int i = 0; i < nameList.length; i++) {
      if (query == nameList[i]) {
        flag = true;
        break;
      } else {
        flag = false;
      }
    }

    return flag == true
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              child: Text(query),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextScreen(s: query),
                    //TextScreen()用于展示我们想要通过搜索到达的页面，
                    //这里用到了构造函数传值。
                  ),
                );
              },
            ))
        : const Center(
            child: Text("没有找到这个蔬菜！！！"),
          );
  }

  //设置推荐
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? recentSuggest
        : nameList.where((input) => input.startsWith(query)).toList();
//判断集合中的字符串是否以搜索框内输入的字符串开头，
//是则返回true，并将筛选出来的结果以list的方式储存在searchList里
    return ListView.builder(
        itemCount: suggestionsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              title: RichText(
                //富文本
                text: TextSpan(
                    text: suggestionsList[index].substring(0, query.length),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionsList[index].substring(query.length),
                          style: const TextStyle(color: Colors.grey))
                    ]),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextScreen(s: suggestionsList[index]),
                ),
              );
            },
          );
        });
  }

  //返回一个主题，也就是可以自定义搜索界面的主题样式
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}

class TextScreen extends StatelessWidget {
  final String s;
  const TextScreen({Key? key, required this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索结果内容"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(s),
          )),
    );
  }
}
