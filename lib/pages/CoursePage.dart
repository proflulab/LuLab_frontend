import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: InkWell(
          //onTap是点击事件回调
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },

          child: Container(
            height: 30.0,
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                //改变搜索外框颜色
                //border: Border.all(color: Colors.black),
                color: Color.fromRGBO(230, 230, 230, 0.8),
                borderRadius: BorderRadius.circular(15)),
            child: Row(children: <Widget>[
              Icon(
                Icons.search,
                color: (Color.fromRGBO(89, 89, 89, 1)),
              ),
              Text(
                "   开始搜索",
                //textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(89, 89, 89, 1),
                  fontSize: 15,
                ),
              )
            ]),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.download_for_offline_outlined,
              color: Color.fromRGBO(117, 117, 117, 1)),
          //如果没有onPressed会报错
          onPressed: () {
            print("跳转到下载记录");
            Navigator.pushNamed(context, '/download');
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("跳转到观看历史");
                Navigator.pushNamed(context, '/history');
              },
              icon: Icon(
                Icons.history,
                color: Color.fromRGBO(117, 117, 117, 1),
              ))
        ],
      ),
      body: Container(
        child: Text("我是PersonPage"),
      ),
    );
  }
}
