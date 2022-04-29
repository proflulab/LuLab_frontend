import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proflu/common/values/values.dart';
import 'package:proflu/common/widget/my_appbar.dart';
import 'package:proflu/common/widget/widgets.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import 'notice_detail.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  late LatestRecord _latestRecord;
  List<LatestRecordElement>? _focusData;
  @override
  void initState() {
    super.initState();
    _handleNotice();
  }

  // 读取通知
  _handleNotice() async {
    _latestRecord = await GqlHomeAPI.ordersInfo(
        variables: LatestRecordRequest(
            authorId: Global.profile.id!, limit: 0, skip: 0),
        context: context);
    setState(() {
      _focusData = _latestRecord.latestRecord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "通知",
      ),
      body: Container(
        height: 1.sh,
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        // decoration: BoxDecoration(
        //     color: Colors.black12,
        //     ),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_focusData == null) {
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
            children: const <Widget>[CircularProgressIndicator(), Text('正在加载')],
          ),
        ),
      );
    }
    if (_focusData!.isEmpty) {
      return _emptyWidget();
    }
    return ListView.builder(
      itemCount: _focusData!.length,
      itemBuilder: (contxt, index) {
        var future =
            DateTime.fromMillisecondsSinceEpoch(_focusData![index].onlineTime);
        String time = formatDate(future, [mm, '月', dd, '日']);
        return InkWell(
          onTap: () async {
            if (kDebugMode) {
              print('到通知详情');
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoticeDetail(product: _focusData![index]),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 150.h,
                width: 1.sw,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  // border: Border.all(color: Colors.black54),
                ),
                margin: EdgeInsets.only(top: 10.h),
                child: Stack(
                  children: <Widget>[
                    //图片
                    Positioned(
                        top: 16.h,
                        left: 20.w,
                        child: CircleAvatar(
                          radius: 70.0.r,
                          backgroundImage:
                              NetworkImage(_focusData![index].imgUrl),
                        )),
                    //标题
                    Positioned(
                      top: 24.0.h,
                      left: 170.0.w,
                      child: Text(
                        _focusData![index].title,
                        style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    //时间
                    Positioned(
                      top: 30.0.h,
                      left: 580.0.w,
                      child: Text(
                        time,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'MyFontStyle',
                          fontSize: 13,
                        ),
                      ),
                    ),
                    //介绍
                    Positioned(
                      top: 80.h,
                      left: 180.w,
                      child: SizedBox(
                        height: 35,
                        width: 400.w,
                        child: Text(
                          _focusData![index].description, //最多60字
                          style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'MyFontStyle',
                              fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _emptyWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/notice.png", width: 400.w, height: 400.w),
          SizedBox(height: 40.w, width: double.infinity),
          PFtext.text1(text: "您还没有通知哦", fontSize: 13, color: PFc.textSecondary)
        ],
      ),
    );
  }
}
