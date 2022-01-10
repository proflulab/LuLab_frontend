// //这个文件放置功勋园组件
// import 'package:flutter/material.dart';
// import'../home/FeastPersonal.dart';
//
//
// class FeatsPage extends StatefulWidget {
//   @override
//   _FeatsPageState createState() => _FeatsPageState();
// }
//
// class _FeatsPageState extends State<FeatsPage> {
//   @override
//   Widget build(BuildContext context) {
//     //获取屏幕高度
//     double screenheight = MediaQuery.of(context).size.height;
//     double screenwidth = MediaQuery.of(context).size.width;
//     var widgetwidth = screenwidth - 10 * 2;
//     return Container(
//       height: screenheight,
//       padding: EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//         //背景颜色在主题处统一设定
//         //color: Colors.black12,
//       ),
//       child: ListView.builder(
//         itemBuilder: (contxt, index) {
//           return Row(
//             children: [
//               //SizedBox(height: 150),
//               Container(
//                   height: 120,
//                   width: widgetwidth,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                     //border: Border.all(color: Colors.black54),
//                   ),
//                   margin: EdgeInsets.only(top: 10),
//
//                   child:ElevatedButton(
//                     child:Stack(
//                       children: <Widget>[
//                         Positioned(
//                           top: 10,
//                           left: 10,
//                           child: Container(
//                             height: 100,
//                             width: 100,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(12.0),
//                               child: Image.network(
//                                   'https://www.itying.com/images/flutter/hot${index + 1}.jpg'),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           left: 130,
//                           child: Container(
//                             height: 20,
//                             child: Text(
//                               '张三-三哥餐饮CEO',
//                               style: TextStyle(
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 35,
//                           left: 130,
//                           child: Container(
//                             height: 40,
//                             width: 200,
//                             child: Text(
//                               '新东方厨师学校毕业，冷链运输专家。',
//                               style: TextStyle(
//                                 fontSize: 13,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 80,
//                           left: 130,
//                           child: Container(
//                             height: 20,
//                             width: 60,
//                             decoration: BoxDecoration(
//                               color: Colors.grey,
//                             ),
//                             child: Text(
//                               '213次观看',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // 点击登录
//                     onPressed:(){
//                       Navigator.push(context,new  MaterialPageRoute(
//                           builder:(context) =>new FeastPersonal()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
//                       );
//                     },
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.grey,),
//                         foregroundColor: MaterialStateProperty.all(Colors.white)//背景颜色
//                     ),
//                   )
//
//               ),
//             ],
//           );
//         },
//         itemCount: 10,
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
//import '../../entitys/entitys.dart';
import '../../widget/widgets.dart';
import 'FeastPersonal.dart';
// import 'test.dart';

class FeatsPage extends StatefulWidget {
  const FeatsPage({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //border: Border.all(color: Colors.black54),
                ),
                margin: const EdgeInsets.only(top: 10),
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
                  decoration: const BoxDecoration(
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FeastPersonal()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
                                    );
                                if (kDebugMode) {
                                  print("进入主页");
                                }
                              },
                              child: const Text("他的主页"),
                            ),
                          ),
                        )),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          height: 70,
                          decoration: const BoxDecoration(
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
                                if (kDebugMode) {
                                  print("关注他");
                                }
                              },
                              child: const Text("关注他"),
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
