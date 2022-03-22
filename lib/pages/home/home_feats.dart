import 'package:flutter/material.dart';
import 'package:proflu/common/values/values.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
//import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'home_feats_personal.dart';

class FeatsPage extends StatefulWidget {
  const FeatsPage({Key? key}) : super(key: key);

  @override
  _FeatsPageState createState() => _FeatsPageState();
}

//这个文件放置功勋园组件
class _FeatsPageState extends State<FeatsPage> {
  late LatestModel _postsData;
  List<LatestModelElement> _focusData = [];

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
      padding: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      child: ListView.builder(
        itemCount: _focusData.length,
        itemBuilder: (contxt, index) {
          if (_focusData.isNotEmpty) {
            //功勋卡片长度
            double _boxw = (1.sw - PFspace.screenMargin * 2);
            //功勋卡片高度
            double _boxh = _boxw * PFr.golden;
            //图片高度
            double _imageh = _boxh * 0.75;
            //图片长度
            double _imagew = _imageh * PFr.golden;
            //底部按钮高度
            double _bottomh = _boxh * (1 - 0.75);
            return SizedBox(
              height: _boxh + 20.h,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Container(
                    height: _imageh,
                    decoration: BoxDecoration(
                        color: PFc.backgroundSecondary,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.r),
                        )),
                    child: Stack(
                      children: <Widget>[
                        //图片
                        positionedImage(
                          top: 0,
                          right: 0,
                          height: _imageh,
                          width: _imagew,
                          context: context,
                          url: _focusData[index].imgUrl,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                          ),
                        ),
                        //姓名
                        positioningText(
                          context: context,
                          top: 40.h,
                          left: PFspace.screenMargin,
                          width: 370.h,
                          height: 40,
                          text: _focusData[index].name,
                          color: PFc.themeColor,
                          fontSize: 25,
                        ),
                        //标签
                        positioningText(
                          context: context,
                          top: 100.h,
                          left: PFspace.screenMargin,
                          width: 370.h,
                          height: 40,
                          text: _focusData[index].identity,
                          color: PFc.textPrimary,
                          fontSize: 15,
                          font: "",
                        ),
                        //介绍
                        positioningText(
                          context: context,
                          top: 175.h,
                          left: PFspace.screenMargin,
                          width: 370.h,
                          height: 40.w,
                          text: _focusData[index].description, //最多60字
                          color: PFc.textPrimary,
                          fontSize: 15,
                          font: "",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _bottomh,
                    decoration: BoxDecoration(
                      color: PFc.backgroundSecondary,
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
                              color: PFc.backgroundSecondary,
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
                                          product: _focusData[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "他的主页",
                                    style: TextStyle(
                                      fontFamily: 'MyFontStyle',
                                      color: PFc.textPrimary,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //分割条
                        // Expanded(
                        //   flex: 0,
                        //   child: Container(
                        //     height: 70.h,
                        //     width: 10.w,
                        //     decoration: BoxDecoration(
                        //         color: Colors.green,
                        //         borderRadius: Radii.a6),
                        //   ),
                        // ),
                        //关注按钮
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
                        //   ),
                        // ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
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
                    Text('正在加载......')
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
