import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  LearnPage({Key? key}) : super(key: key);

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  int _selectIndex = 0;
  List _learnList = [1, 2, 3, 4];
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
      body: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: double.infinity,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          print("点击了课程目录");
                          _selectIndex = index;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        child: Text("${index}", textAlign: TextAlign.center),
                        color:
                            _selectIndex == index ? Colors.blue : Colors.white,
                      ),
                    ),
                    Divider(
                      //是控件的高，并不是线的高度，绘制的线居中
                      height: 5,
                      //线的高度
                      //thickness: 5,
                      //color: Colors.red,
                      //分割线前面空白区域
                      //indent: 10,
                      //分割线后面空白区域。
                      endIndent: 10,
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(5),
                height: double.infinity,
                color: Color.fromRGBO(240, 246, 246, 0.9),
                child: GridView.builder(
                  //纵轴⼦元素的数量。此属性值确定后⼦元素在纵轴的⻓度就确定了
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      //⼦元素在纵轴⻓度和主轴⻓度的⽐例。由于crossAxisCount指定后⼦元素纵轴⻓度就确定了，然后通过此参数值就可以确定⼦元素在主轴的⻓度。
                      //childAspectRatio: 0.9,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 20),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(
                                "https://upload-images.jianshu.io/upload_images/10847113-884a22519c2c5151.jpg",
                                fit: BoxFit.cover),
                          ),
                          Container(
                            height: 40,
                            child: Text("课程"),
                          )
                        ],
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
