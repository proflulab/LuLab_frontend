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

import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import 'feast_personal.dart';

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
    //double screenwidth = MediaQuery.of(context).size.width;
    //var widgetwidth = screenwidth - 10 * 2;
    return Container(
      height: 1.sh,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      // decoration: BoxDecoration(
      //     color: Colors.black12,
      //     ),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (contxt, index) {
          return Column(
            children: [
              Container(
                height: 250.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  //border: Border.all(color: Colors.black54),
                ),
                margin: EdgeInsets.only(top: 10.h),
                child: Stack(
                  children: <Widget>[
                    //图片
                    Positioned(
                      top: 0,
                      left: 230,
                      child: Container(
                        height: 250.h,
                        width: 120,
                        decoration: BoxDecoration(
                          //设置四周圆角 角度
                          borderRadius: Radii.k15pxRadius,
                        ),
                        child: Image.network(
                          'https://scpic2.chinaz.net/Files/pic/pic9/202108/bpic2394$index.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    //姓名
                    const Positioned(
                      top: 10.0,
                      left: 75.0,
                      child: Text(
                        '陆向谦',
                        style: TextStyle(
                          fontFamily: 'MyFontStyle',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    //标签
                    Positioned(
                      top: 40,
                      left: 80,
                      child: Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                            //设置四周圆角 角度
                            borderRadius: Radii.k15pxRadius,
                            color: Colors.greenAccent,
                          ),
                          child: const Text('CEO',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15))),
                    ),
                    //介绍
                    const Positioned(
                        top: 60,
                        left: 20,
                        child: SizedBox(
                            height: 80,
                            width: 188,
                            child: Text(
                                '介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍', //最多60字
                                style: TextStyle(
                                    fontFamily: 'MyFontStyle', fontSize: 15)))),
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
                  height: 80.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
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
                              child: const Text(
                                "他的主页",
                                style: TextStyle(
                                    fontFamily: 'MyFontStyle', fontSize: 20),
                              ),
                            ),
                          ),
                        )),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          height: 70.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: Radii.k6pxRadius),
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
                              child: const Text(
                                "关注他",
                                style: TextStyle(
                                    fontFamily: 'MyFontStyle', fontSize: 20),
                              ),
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
