import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import '../../entitys/entitys.dart';
import '../../widget/widgets.dart';
import '../../utils/utils.dart';
import '../../values/values.dart';
//import '../../api/apis.dart';

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
                height: 200.h,
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
                          height: 70.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: Colors.amber,
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
