import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proflu/common/api/gql_latestrecord.dart';
import 'package:proflu/common/entitys/latestrecord_data.dart';
import 'package:proflu/common/global/global.dart';
import 'package:proflu/common/values/size_radii.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  late LatestRecord _latestRecord;
  List _focusData = [];
  @override
  void initState() {
    super.initState();
    _handleNotice();
  }

  // 读取通知
  _handleNotice() async {
    LatestRecordRequest variables =
        LatestRecordRequest(authorId: Global.profile.data.id);
    _latestRecord = await GqlLatestRecordAPI.indexPageInfo(
        variables: variables, context: context);
    setState(() {
      _focusData = _latestRecord.latestRecord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '通知',
            style: TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.green,
              fontSize: 24,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          //centerTitle: true,
        ),
        body: Container(
          height: 1.sh,
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          // decoration: BoxDecoration(
          //     color: Colors.black12,
          //     ),
          child: ListView.builder(
            itemCount: _focusData.length,
            itemBuilder: (contxt, index) {
              var time = _focusData[index].onlineTime.toString();
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
                          //标题
                          Positioned(
                            top: 40.0.h,
                            left: 15.0.w,
                            child: Text(
                              _focusData[index].title,
                              style: const TextStyle(
                                fontFamily: 'MyFontStyle',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          //时间
                          Positioned(
                            top: 80.0.h,
                            left: 15.0.w,
                            child: Text(
                              time,
                              style: const TextStyle(
                                fontFamily: 'MyFontStyle',
                                fontSize: 15,
                              ),
                            ),
                          ),
                          //介绍
                          Positioned(
                              top: 140.h,
                              left: 15.w,
                              child: SizedBox(
                                  height: 80,
                                  width: 188,
                                  child: Text(
                                      _focusData[index].description, //最多60字
                                      style: const TextStyle(
                                          fontFamily: 'MyFontStyle',
                                          fontSize: 13)))),
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
                                    onTap: () {},
                                    child: const Text(
                                      "查看详情",
                                      style: TextStyle(
                                          fontFamily: 'MyFontStyle',
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              )),
                            ),
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
        ));
  }
}
