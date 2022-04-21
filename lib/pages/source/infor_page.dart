import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'infor_details.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage>
    with AutomaticKeepAliveClientMixin {
  late Inforponse _postsIfoData;
  List<LatestInformation> _focusData = [];

  late EasyRefreshController _controllerCourse;

  //第一次请求获取课程个数
  final int _countFirst = 16;

  //刷新请求获取课程个数
  int _count = 16;

  //底部刷新请求个数
  final int _countDown = 16;

  @override
  void initState() {
    super.initState();
    _controllerCourse = EasyRefreshController();
    _loadIfoData(0, _countFirst);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerCourse.dispose();
  }

  // 获取所有数据
  _loadIfoData(int skip, int limit) async {
    _postsIfoData = await SourseAPI.inforInfo(
        context: context, variables: Inforrequest(limit: limit, skip: skip));
    if (mounted) {
      setState(() {
        if (skip > 0) {
          _focusData.addAll(_postsIfoData.latestInformation);
        } else {
          _focusData = _postsIfoData.latestInformation;
        }
      });
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBarCommon(context: context, title: '资讯'),
      body: EasyRefresh.custom(
        firstRefresh: true,
        firstRefreshWidget: const Loading(),
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controllerCourse,
        header: EasyrefreshWidget.getHeader(),
        footer: EasyrefreshWidget.getFooter(),
        onRefresh: () async {
          _loadIfoData(0, _countFirst);
          await Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              setState(
                () {
                  _count = _countFirst;
                },
              );
            }
            _controllerCourse.resetLoadState();
          });
        },
        onLoad: () async {
          _loadIfoData(_count, _countDown);
          await Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _count += _countDown;
                print(_count);
                print(_focusData.length);
              });
            }
            _controllerCourse.finishLoad(noMore: _count > _focusData.length);
          });
        },
        slivers: <Widget>[
          buildListWidget(),
        ],
      ),
    );
  }

  Widget buildListWidget() {
    double gap = PFspace.screenMargin / 2;
    if (_focusData.isEmpty) {
      return const SliverToBoxAdapter(child: Loading());
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _inforWidget(_focusData[index]);
          if (_focusData.isNotEmpty) {
            if (index == 0) {
              print(_focusData[index].toJson());
            }
            return InkWell(
              onTap: () async {
                if (kDebugMode) {
                  print('到资讯详情');
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InforDetails(
                      product: _focusData[index],
                    ),
                  ),
                );
              },
              child: Container(
                height: PFspace.screenW * PFr.bronze - gap,
                padding: EdgeInsets.only(
                  left: PFspace.screenMargin,
                  right: PFspace.screenMargin,
                  top: PFspace.screenMargin,
                  bottom: PFspace.screenMargin,
                ),
                margin: EdgeInsets.only(
                  bottom: gap,
                  left: PFspace.screenMargin,
                  right: PFspace.screenMargin,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: PFspace.screenW * PFr.bronze - 5 * gap,
                      width: (PFspace.screenW * PFr.bronze - 5 * gap) /
                          PFr.ratio3_4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        child: CachedImage.typeLaod(_focusData[index].img),
                      ),
                    ),
                    SizedBox(width: PFspace.screenMargin),
                    Flexible(
                        child: Stack(
                      children: <Widget>[
                        Positioned(
                            //其他的组件加上去以这种形式
                            top: 5.0.h,
                            left: 10.0.w,
                            child: SizedBox(
                              height: 90.h,
                              width: 380.w,
                              child:
                                  PFtext.text1(text: _focusData[index].title),
                            )),
                        Positioned(
                            //其他的组件加上去以这种形式
                            top: 110.0.h,
                            left: 220.0.w,
                            child: SizedBox(
                              height: 30.h,
                              width: 180.w,
                              child: Text(
                                TimeChange.client(
                                    int.parse(_focusData[index].releaseDate),
                                    "ymd"),
                                textAlign: TextAlign.left,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: PFc.textSecondary,
                                  fontFamily: '',
                                  fontSize: 11,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ],
                    )
                        // Column(
                        //   children: [
                        //     PFtext.text1(text: _focusData[index].title),
                        //     SizedBox(
                        //       height: 50.h,
                        //     ),
                        //     Text(
                        //       TimeChange.client(
                        //           int.parse(_focusData[index].releaseDate),
                        //           "ymd"),
                        //       textAlign: TextAlign.left,
                        //       softWrap: false,
                        //       overflow: TextOverflow.ellipsis,
                        //       maxLines: 1,
                        //       style: const TextStyle(
                        //         color: PFc.textSecondary,
                        //         fontFamily: '',
                        //         fontSize: 11,
                        //         //fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        )
                  ],
                ),
              ),
            );
          } else {
            return const Loading();
          }
        },
        childCount: _count > _focusData.length ? _focusData.length : _count,
      ),
    );
  }

  Widget _inforWidget(LatestInformation focusData) {
    return Container(
      width: 690.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          SizedBox(
            width: 250.w,
            height: 166.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedImage.typeLaod(focusData.img),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 68.w,
                  child: PFtext.text1(
                      text: focusData.title, maxLines: 2, fontSize: 30.w),
                  margin: EdgeInsets.only(bottom: 18.w),
                ),
                PFtext.text2(
                    text: focusData.introduction,
                    maxLines: 2,
                    fontSize: 26.w,
                    fontWeight: FontWeight.normal,
                    color: PFc.textSecondary)
              ],
            ),
          )
        ],
      ),
    );
  }
}
