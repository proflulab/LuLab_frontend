import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import 'home_feats_personal.dart';

class FeatsPage extends StatefulWidget {
  const FeatsPage({Key? key}) : super(key: key);

  @override
  _FeatsPageState createState() => _FeatsPageState();
}

//这个文件放置功勋园组件
class _FeatsPageState extends State<FeatsPage> {
  late LatestModel _postsData;
  List _focusData = [];

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await GqlModelAPI.indexPageInfo(schema: '', context: context);
    var focusList = _postsData.latestModel;

    setState(() {
      _focusData = focusList;
    });
  }

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
        itemCount: _focusData.length,
        itemBuilder: (contxt, index) {
          if (_focusData.isNotEmpty) {
            return Column(
              children: [
                Container(
                  height: 250.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.r),
                    ),
                    //border: Border.all(color: Colors.black54),
                  ),
                  margin: EdgeInsets.only(top: 10.h),
                  child: Stack(
                    children: <Widget>[
                      //图片
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 250.h,
                          width: 220.w,
                          decoration: BoxDecoration(
                            //设置四周圆角 角度
                            borderRadius: Radii.k15pxRadius,
                            image: DecorationImage(
                              image: NetworkImage(_focusData[index].imgUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      //姓名
                      Positioned(
                        top: 40.0.h,
                        left: 15.0.w,
                        child: Text(
                          _focusData[index].name,
                          style: const TextStyle(
                            fontFamily: 'MyFontStyle',
                            fontSize: 25,
                          ),
                        ),
                      ),
                      //标签
                      Positioned(
                          top: 80.h,
                          left: 15.w,
                          child: SizedBox(
                            width: 370.h,
                            child: Text("身份：" + _focusData[index].identity,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontFamily: 'MyFontStyle',
                                    color: Colors.green,
                                    fontSize: 15)),
                          )
                          // Container(
                          //     height: 20,
                          //     width: 100,
                          //     decoration: BoxDecoration(
                          //       //设置四周圆角 角度
                          //       borderRadius: Radii.k15pxRadius,
                          //       color: Colors.greenAccent,
                          //     ),
                          //     child: Text(_focusData[index].identity,
                          //         textAlign: TextAlign.center,
                          //         style: const TextStyle(
                          //             fontFamily: 'MyFontStyle', fontSize: 15))),
                          ),
                      //介绍
                      Positioned(
                          top: 120.h,
                          left: 15.w,
                          child: SizedBox(
                              height: 80,
                              width: 188,
                              child: Text(_focusData[index].description, //最多60字
                                  style: const TextStyle(
                                      fontFamily: 'MyFontStyle',
                                      fontSize: 18)))),
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
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const FeastPersonal()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
                                  //     );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FeastPersonal(
                                              product: _focusData[index])));
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
                        // Expanded(
                        //   flex: 0,
                        //   child: Container(
                        //     height: 70.h,
                        //     width: 10.w,
                        //     decoration: BoxDecoration(
                        //         color: Colors.green,
                        //         borderRadius: Radii.k6pxRadius),
                        //   ),
                        // ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Center(
                        //       child: Container(
                        //     width: 100,
                        //     height: 40,
                        //     color: Colors.white,
                        //     child: Center(
                        //       child: InkWell(
                        //         onTap: () {
                        //           if (kDebugMode) {
                        //             print("关注他");
                        //           }
                        //         },
                        //         child: const Text(
                        //           "关注他",
                        //           style: TextStyle(
                        //               fontFamily: 'MyFontStyle', fontSize: 20),
                        //         ),
                        //       ),
                        //     ),
                        //   )),
                        // ),
                      ],
                    ))
              ],
            );
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(color: Colors.transparent),
              alignment: Alignment.center,
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0x88000000),
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text('正在加载')
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
