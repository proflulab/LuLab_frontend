import 'package:flutter/material.dart';

//import '../../entitys/entitys.dart';
import '../../widget/widgets.dart';
import '../../utils/utils.dart';
//import '../../api/apis.dart';

class FeatsPage extends StatefulWidget {
  @override
  _FeatsPageState createState() => _FeatsPageState();
}

//这个文件放置功勋园组件
class _FeatsPageState extends State<FeatsPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕高度
    //double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth - 10 * 2;
    return Container(
      height: 1.sh,
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
                  ),
                  //border: Border.all(color: Colors.black54),
                ),
                margin: EdgeInsets.only(top: 10),
                child: Stack(
                  children: <Widget>[
                    positionedImage(
                        context: context,
                        top: 10,
                        left: 500,
                        height: 200,
                        width: 200,
                        url:
                            'https://www.itying.com/images/flutter/hot${index + 1}.jpg'),
                    positionedText(
                        context: context,
                        top: 30,
                        left: 50,
                        height: 40,
                        width: 200,
                        text: '张三-三哥餐饮CEO'),
                    positionedText(
                        context: context,
                        top: 80,
                        left: 50,
                        height: 40,
                        width: 200,
                        text: '新东方厨师学校毕业，冷链运输专家。'),
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
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                            child: Container(
                          width: 100,
                          height: 40,
                          color: Colors.white,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                print("进入主页");
                              },
                              child: Text("他的主页"),
                            ),
                          ),
                        )),
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
                        child: Center(
                            child: Container(
                          width: 100,
                          height: 40,
                          color: Colors.white,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                print("关注他");
                              },
                              child: Text("关注他"),
                            ),
                          ),
                        )),
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
