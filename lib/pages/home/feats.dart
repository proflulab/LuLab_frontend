//这个文件放置功勋园组件
import 'package:flutter/material.dart';

class FeatsPage extends StatefulWidget {
  @override
  _FeatsPageState createState() => _FeatsPageState();
}

class _FeatsPageState extends State<FeatsPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕高度
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth - 10 * 2;
    return Container(
      height: screenheight,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          //背景颜色在主题处统一设定
          //color: Colors.black12,
          ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (contxt, index) {
          return Column(
            children: [
              Container(
                height: 170,
                width: widgetwidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  border: Border.all(color: Colors.black54),
                ),
                margin: EdgeInsets.only(top: 10),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        height: 150,
                        width: 140,
                        color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                              'https://www.itying.com/images/flutter/hot${index + 1}.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        height: 20,
                        child: Text(
                          '张三-三哥餐饮CEO',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 10,
                      child: Container(
                        height: 40,
                        width: 200,
                        child: Text(
                          '新东方厨师学校毕业，冷链运输专家。',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 80,
                    //   left: 10,
                    //   child: Container(
                    //     height: 20,
                    //     width: 60,
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey,
                    //     ),
                    //     child: Text(
                    //       '213次观看',
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                  height: 80,
                  width: widgetwidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 100,
                          height: 40,
                          color: Colors.green,
                          child: InkWell(
                            onTap: () {
                              print("进入主页");
                            },
                            child: Text("他的主页"),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                            color: Colors.grey,
                            width: 5,
                          ))),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 100,
                          height: 40,
                          color: Colors.green,
                          child: InkWell(
                            onTap: () {
                              print("关注他");
                            },
                            child: Text("关注他"),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
