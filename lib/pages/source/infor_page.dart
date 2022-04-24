import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/widget/widgets.dart';
import 'infor_item_widget.dart';

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
    if (_focusData.isEmpty) {
      return SliverToBoxAdapter(child: Container());
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _inforWidget(_focusData[index]);
        },
        childCount: _count > _focusData.length ? _focusData.length : _count,
      ),
    );
  }

  Widget _inforWidget(LatestInformation focusData) {
    return InfoItemWidget(information: focusData);
  }
}
