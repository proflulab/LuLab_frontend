import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.fromLTRB(82, 30, 0, 0),
            child: Text(
              '开通会员',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.green,
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('assets/markdown/markdown.md'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data,
              selectable: true,
              styleSheet: MarkdownStyleSheet(
                // 支持修改样式
                h1: const TextStyle(fontSize: 14),
              ),
            );
          } else {
            return const Center(
              child: Text("加载中..."),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 100,
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 30),
            child: Row(
              children: [
                const Text(
                  '两年学籍 ：',
                  style: TextStyle(fontSize: 18),
                ),
                const Text(
                  '¥1888',
                  style: TextStyle(color: Colors.orange, fontSize: 18),
                ),
                const SizedBox(width: 70),
                TextButton(
                    onPressed: () {
                      // 按钮点击事件
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0), // 设置圆角半径
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(140, 0))),
                    child: const Text(
                      '立即开通',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
              ],
            )),
      )),
    );
  }
}
