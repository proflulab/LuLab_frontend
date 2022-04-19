import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';

import '/pages/home/home_feats_videos.dart';
import '../../common/api/apis.dart';
//import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

// import 'tab_barin_feast.dart';

class FeastPersonal extends StatefulWidget {
  const FeastPersonal({Key? key, required this.product}) : super(key: key);
  final LatestClassificationUser product;

  @override
  _FeastPersonalState createState() => _FeastPersonalState();
}

class _FeastPersonalState extends State<FeastPersonal> {
  bool mIsExpansion = false;

  //最大显示行数（默认 3 行）
  int mMaxLine = 3;

  late FeatsExperienceReponse _postsData;
  List<LatestUserGrowth> _focusData = [];

  LatestClassificationUser get product => widget.product;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有功勋员数据
  _loadAllData() async {
    _postsData = await GqlHomeAPI.featExperienceInfo(
      context: context,
      variables: FeatsExperienceRequest(
          limit: 0, skip: 0, userId: '624e90a7b2cc58a87ff8432c'),
    );

    if (mounted) {
      setState(() {
        _focusData = _postsData.latestUserGrowth;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Positioned.fill(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 440.w,
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    product.bigCoverUrl!,
                  ),
                  fit: BoxFit.cover,
                )),
                alignment: Alignment.center,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    print("==");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeatsVideo(
                          classificationUser: widget.product,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: 84.w,
                    height: 84.w,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 60.w,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -10.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(-10.w, -35.w),
                        child: Container(
                          width: 124.w,
                          height: 124.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(124.w)),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 116.w,
                            height: 116.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(58.w),
                              child:
                                  CachedImage.typeLaod(product.profileImgUrl!),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PFtext.text1(text: product.name!, fontSize: 16),
                          SizedBox(width: 10.w),
                          Container(
                            height: 27.64.w,
                            width: 130.w,
                            padding: EdgeInsets.only(left: 27.5.w),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/identity_bg.png"))),
                            alignment: Alignment.center,
                            child: PFtext.text1(
                                text: product.identity ?? "",
                                fontSize: 8,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.w),
                      Row(
                        children: [
                          PFtext.text1(
                              text:
                                  "${product.address ?? '地址'}   |${product.schoolRecord ?? '学历'}  |${product.sex == '0' ? '男' : '女'}   |${product.workCondition ?? '工作状态'} ",
                              fontSize: 12),
                        ],
                      ),
                      SizedBox(height: 12.w),
                      PFtext.text1(
                        text: "${product.duration ?? 0}年工作经验",
                        fontSize: 12,
                      ),
                      const Divider(height: 40),
                      ReadMoreText(
                        product.detailMsg ?? "",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimExpandedText: "收起",
                        trimCollapsedText: "展开",
                        colorClickableText: PFc.thirdElementText,
                        callback: (v) {
                          print("==");
                        },
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "MyFontStyle",
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(30.w),
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PFtext.text1(text: "个人经历", fontSize: 18),
                    SizedBox(height: 15),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (c, i) {
                        LatestUserGrowth growth = _focusData[i];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 90.w,
                                height: 90.w,
                                child: CachedImage.typeLaod(growth.logoUrl)),
                            SizedBox(width: 20.w),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PFtext.text1(
                                    text: growth.position, fontSize: 16),
                                SizedBox(height: 20.w),
                                PFtext.text1(
                                    text:
                                        "${TimeChange.client(int.parse(growth.beginTime), "ym")}  - ${TimeChange.client(int.parse(growth.endTime), "ym")}",
                                    fontSize: 14,
                                    color: PFc.textSecondary),
                                SizedBox(height: 20.w),
                                PFtext.text1(
                                    text: "${growth.company}，${growth.desc}",
                                    fontSize: 16),
                              ],
                            ))
                          ],
                        );
                      },
                      separatorBuilder: (c, i) => Divider(height: 1),
                      itemCount: _focusData.length,
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
        Positioned(top: 0, left: 0, right: 0, child: _buildAppbar()),
      ],
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 44,
    );
  }

  // _img() {
  //   return Container(
  //     height: 250.h,
  //     margin: EdgeInsets.only(
  //       left: PFspace.screenMargin,
  //       right: PFspace.screenMargin,
  //       top: 10,
  //     ),
  //     decoration: BoxDecoration(
  //       color: PFc.backgroundSecondary,
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(25.w)),
  //     ),
  //     child: Stack(
  //       children: [
  //         Positioned(
  //           child: SizedBox(
  //             height: 180.h,
  //             //width: MediaQuery.of(context).size.width,
  //             width: double.infinity,
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(25.w),
  //               ),
  //               child: CachedImage.typeLaod(widget.product.profileImgUrl),
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           top: 170.h,
  //           right: 40.w,
  //           child: RawChip(
  //             label: const Text('视频介绍'),
  //             onPressed: () {
  //               if (kDebugMode) {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => FeatsVideo(
  //                       classificationUser: widget.product,
  //                     ),
  //                   ),
  //                 );
  //               }
  //             },
  //             onDeleted: () {},
  //             backgroundColor: PFc.themeColor30,
  //             deleteIcon: const Icon(Icons.play_circle_filled_rounded),
  //             deleteIconColor: Colors.red,
  //             deleteButtonTooltipMessage: '播放',
  //           ),
  //         ),
  //         Positioned(
  //           width: 140.w,
  //           height: 140.w,
  //           top: 140.h,
  //           left: 20.w,
  //           child: Container(
  //             padding: EdgeInsets.all(10.w),
  //             decoration: BoxDecoration(
  //               color: PFc.backgroundSecondary,
  //               borderRadius: BorderRadius.all((Radius.circular(70.w))),
  //             ),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(75.w),
  //               ),
  //               child: CachedImage.typeLaod(widget.product.profileImgUrl),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // _profileInfo() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
  //     padding: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
  //     decoration: BoxDecoration(
  //       color: PFc.backgroundSecondary,
  //       borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.w)),
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             Text(widget.product.name),
  //             SizedBox(width: 5.w),
  //             Icon(
  //               widget.product.sex == "1"
  //                   ? Icons.male
  //                   : widget.product.sex == "2"
  //                       ? Icons.female
  //                       : null,
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 15.w),
  //         Row(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(5),
  //               decoration: BoxDecoration(
  //                 color: PFc.themeColor30,
  //                 borderRadius: BorderRadius.all(Radius.circular(15.w)),
  //               ),
  //               child: Row(
  //                 children: const [Text("特斯拉"), Icon(Icons.fitbit_sharp)],
  //               ),
  //             ),
  //             SizedBox(width: 15.w),
  //             Container(
  //               padding: const EdgeInsets.all(5),
  //               decoration: BoxDecoration(
  //                 color: PFc.themeColor30,
  //                 borderRadius: BorderRadius.all(Radius.circular(15.w)),
  //               ),
  //               child: Row(
  //                 children: const [Text("高管"), Icon(Icons.fitbit_sharp)],
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 15.w),
  //         Row(
  //           children: [
  //             const Text("所在位置"),
  //             SizedBox(width: 5.w),
  //             Text(widget.product.location[0] +
  //                 "·" +
  //                 widget.product.location[1]),
  //           ],
  //         ),
  //         SizedBox(height: 15.w),
  //         Row(
  //           children: [
  //             const Text("家      乡"),
  //             SizedBox(width: 5.w),
  //             Text(widget.product.homeTown[0] +
  //                 "·" +
  //                 widget.product.homeTown[1]),
  //           ],
  //         ),
  //         const Divider(),
  //         richText(widget.product.detailMsg),
  //       ],
  //     ),
  //   );
  // }

  _experience() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      padding: EdgeInsets.all(PFspace.screenMargin),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.all(Radius.circular(25.w)),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("个人经历"),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _focusData.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 100.w,
                    child: CachedImage.typeLaod(_focusData[index].logoUrl),
                  ),
                  SizedBox(width: PFspace.ruleS),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_focusData[index].position),
                        Text(_focusData[index].company),
                        Text(TimeChange.client(
                                int.parse(_focusData[index].beginTime), "ym") +
                            "—" +
                            TimeChange.client(
                                int.parse(_focusData[index].endTime), "ym")),
                        Text(_focusData[index].desc),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  //_text：显示的文字
  Widget richText(String _text) {
    if (isExpansion(_text)) {
      //如果需要截断
      if (mIsExpansion) {
        return Column(
          children: <Widget>[
            Text(
              _text,
              textAlign: TextAlign.left,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  _isShowText();
                },
                child: const Text("<收起"),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            Text(
              _text,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  _isShowText();
                },
                child: const Text("全文>"),
              ),
            ),
          ],
        );
      }
    } else {
      return Text(
        _text,
        maxLines: 3,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  bool isExpansion(String text) {
    TextPainter _textPainter = TextPainter(
      maxLines: 3,
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 1.sw, minWidth: 1.sw);
    if (_textPainter.didExceedMaxLines) {
      //这里判断 文本是否截断
      return true;
    } else {
      return false;
    }
  }

  void _isShowText() {
    if (mIsExpansion) {
      //关闭了
      setState(
        () {
          mIsExpansion = false;
        },
      );
    } else {
      setState(
        () {
          mIsExpansion = true;
        },
      );
    }
  }
}

// class FeastPersonal extends StatefulWidget {
//   const FeastPersonal({Key? key, required this.product}) : super(key: key);
//   final LatestClassificationUser product;

//   @override
//   _FeastPersonalState createState() => _FeastPersonalState();
// }

// class _FeastPersonalState extends State<FeastPersonal> {
//   late final model = widget.product;
//   var a = 1.sw;
//   var b = 1.sh;
//   @override
//   Widget build(BuildContext context) {
//     var stack = Stack(
//       children: <Widget>[
//         Positioned(
//           child: Container(
//             width: PFspace.screenW,
//             height: PFspace.screenW * PFr.ratio9_16,
//             alignment: Alignment.center, //在容器的位置
//             child: VideoView(
//               widget.product.videos[1],
//               //'https://media.w3.org/2010/05/sintel/trailer.mp4',
//               cover: 'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
//             ),
//           ),
//         ),
//         Positioned(
//           top: a * 9 / 16,
//           // right: 10,
//           child: Container(
//             //从这里开始
//             height: b - a * 9 / 16,
//             width: 750.w,
//             decoration: const BoxDecoration(
//               //背景
//               color: Colors.white,
//               //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//             ),
//           ),
//         ),
//         Positioned(
//           top: a * 9 / 16 - 20,
//           left: 25.0,
//           child: CircleAvatar(
//             //底层的组件
//             backgroundImage: NetworkImage(widget.product.imgUrl),
//             radius: 40.0, //参数
//           ),
//         ),
//         Positioned(
//           top: 230.0,
//           left: 220.0,
//           child: SizedBox(
//             width: 200.0.w, //容器的相关参数
//             height: 100.0.h,
//             // color: Colors.green,
//             child: Text(
//               widget.product.name,
//               style: const TextStyle(
//                 fontFamily: 'MyFontStyle',
//                 color: Colors.black,
//                 fontSize: 30,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 270.0,
//           left: 210.0,
//           child: SizedBox(
//             width: 200.0.w, //容器的相关参数
//             height: 100.0.h,
//             // color: Colors.green,
//             child: Text(
//               widget.product.identity,
//               style: const TextStyle(
//                 fontFamily: 'MyFontStyle',
//                 color: Colors.black,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 330.0,
//           left: 38.0,
//           child: SizedBox(
//             width: 800.0.w, //容器的相关参数
//             height: 200.0.h,
//             // color: Colors.green,
//             child: Text(
//               widget.product.description,
//               style: const TextStyle(
//                 fontFamily: 'MyFontStyle',
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//     return Scaffold(
//       appBar: PreferredSize(
//         //设置appBar高度
//         preferredSize: const Size.fromHeight(0),
//         child: AppBar(),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             width: 375.0.w,
//             height: 1.sh,
//             color: Colors.grey,
//             child: stack,
//           ),
//           // Container(
//           //   width: 375.0.w,
//           //   height: 500.0.h,
//           //   alignment: Alignment.center,
//           //   child: const AppBardemoPage(),
//           // ),
//         ],
//       ),
//     );
//   }
// }
