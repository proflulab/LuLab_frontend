import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';

import '../other/loading.dart';
import 'infor_details.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late Inforponse _postsIfoData;
  List<LatestInformation> _focusData = [];

  late EasyRefreshController _controllerCourse;

  //第一次请求获取课程个数
  final int _countFirst = 10;

  //刷新请求获取课程个数
  int _count = 10;

  //底部刷新请求个数
  final int _countDown = 12;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "资讯",
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: Colors.green,
            fontSize: 24,
          ),
        ),
      ),
      body: EasyRefresh.custom(
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controllerCourse,
        header: ClassicalHeader(),
        footer: ClassicalFooter(),
        onRefresh: () async {
          _loadIfoData(0, _countFirst);
          await Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _count = _countFirst;
            });
            _controllerCourse.resetLoadState();
          });
        },
        onLoad: () async {
          _loadIfoData(_count, _countDown);
          await Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _count += _countDown;
            });
            _controllerCourse.finishLoad(noMore: _count > _focusData.length);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (_focusData.isNotEmpty) {
                  return InkWell(
                    onTap: () async {
                      if (kDebugMode) {
                        print('到咨询详情');
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
                      height: 170.h,
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      margin: EdgeInsets.only(
                          bottom: 10.h, left: 30.w, right: 30.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Stack(
                        children: <Widget>[
                          //资讯封面
                          positionedImage(
                            context: context,
                            top: 10,
                            left: 10,
                            height: 100,
                            width: 100,
                            url: _focusData[index].img,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          // 资讯标题
                          positioningText(
                            context: context,
                            top: 30.h,
                            left: 230.w,
                            height: 90.h,
                            width: 500.w,
                            text: _focusData[index].title,
                          ),
                          // 观看次数
                          // positionedText(
                          //     context: context,
                          //     top: 60,
                          //     left: 180,
                          //     height: 40,
                          //     width: 200,
                          //     text: "test"),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Loading();
                }
              },
              childCount:
                  _count > _focusData.length ? _focusData.length : _count,
            ),
          ),
        ],
      ),
    );
  }
}
