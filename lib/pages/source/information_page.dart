import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _loadIfoData();
  }

  // 获取所有数据
  _loadIfoData() async {
    _postsIfoData = await SourseAPI.inforInfo(
        context: context, variables: Inforrequest(limit: 0, skip: 0));

    if (mounted) {
      setState(() {
        _focusData = _postsIfoData.latestInformation;
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
      body: ListView.builder(
        itemCount: _focusData.length,
        itemBuilder: (context, index) {
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
                margin: EdgeInsets.only(bottom: 10.h, left: 30.w, right: 30.w),
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
                    ),
                    // 资讯标题
                    positioningText(
                      context: context,
                      top: 30.h,
                      left: 180.w,
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
      ),
    );
  }
}
