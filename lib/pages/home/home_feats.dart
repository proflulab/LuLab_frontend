import 'package:flutter/material.dart';

//import '../../common/staticdata/staticdata.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

import 'home_feats_personal.dart';
import 'home_feats_videos.dart';

class FeatsPage extends StatefulWidget {
  const FeatsPage({Key? key}) : super(key: key);

  @override
  _FeatsPageState createState() => _FeatsPageState();
}

//这个文件放置功勋园组件
class _FeatsPageState extends State<FeatsPage>
    with AutomaticKeepAliveClientMixin {
  late Feats _postsData;
  List<LatestClassificationUser> _focusData = [];

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // _postsDataProduct = Train.fromJson(Jsondata.personalInfo);

  // 读取所有功勋员数据
  _loadAllData() async {
    _postsData = await GqlHomeAPI.featInfo(
      context: context,
      variables: FeatsRequest(limit: 0, skip: 0, category: '2'),
    );

    if (mounted) {
      setState(() {
        _focusData = _postsData.latestClassificationUser;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
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
          return Container(
            margin: EdgeInsets.only(
                right: PFspace.screenMargin, left: PFspace.screenMargin),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  height: _imageh,
                  decoration: BoxDecoration(
                    color: PFc.backgroundSecondary,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20.0.h,
                        left: 170.0.w,
                        child: SizedBox(
                          width: 690.0.w, //容器的相关参数
                          height: 80.0.h,
                          // color: Colors.green,
                          child: PFtext.text1(
                            text: _focusData[index].name,
                            color: PFc.textEmphasis,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120.0.h,
                        left: 60.0.w,
                        child: SizedBox(
                          width: 380.0.w, //容器的相关参数
                          height: 80.0.h,
                          child: PFtext.text2(
                            text: _focusData[index].description,
                            color: PFc.thirdElement,
                            fontSize: 13,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0.h,
                        right: 0.0.w,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FeatsVideo(
                                  classificationUser: _focusData[index],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                width: _imagew,
                                height: _imageh,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.r),
                                  ),
                                  child: CachedImage.typeLaod(
                                      _focusData[index].imgUrl),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  width: 150.w,
                                  height: 44.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(44.w),
                                    color: PFc.themeColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.play_circle_outline_rounded,
                                        color: Colors.white,
                                        size: 36.w,
                                      ),
                                      SizedBox(width: 4.w),
                                      PFtext.text1(
                                        text: "视频介绍",
                                        color: Colors.white,
                                        fontSize: 22.w,
                                      ),
                                    ],
                                  ),
                                ),
                                bottom: 30.w,
                                right: 22.w,
                              ),
                            ],
                          ),
                        ),
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
    );
  }
}
