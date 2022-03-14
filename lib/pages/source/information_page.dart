import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';
import 'infor_details.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late Inforponse _postsIfoData;
  List _focusData = [];

  @override
  void initState() {
    super.initState();
    _loadIfoData();
  }

  // 读取所有数据
  _loadIfoData() async {
    _postsIfoData = await SourseAPI.userup(context: context, schema: '');
    var focusList = _postsIfoData.latestInformation;

    setState(() {
      _focusData = focusList;
    });
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
                        builder: (context) =>
                            InforDetails(product: _focusData[index])));
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
                    // 资讯封面
                    // positionedImage(
                    //     context: context,
                    //     top: 10,
                    //     left: 10,
                    //     height: 150,
                    //     width: 150,
                    //     url:
                    //         'https://image2.cnpp.cn/upload/images/20210427/17584971448_207x90.gif'),
                    // 资讯标题
                    positioningText(
                        context: context,
                        top: 30,
                        left: 180,
                        height: 90,
                        width: 500,
                        text: _focusData[index].title),
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
            return Container(
              height: 100,
              width: 200,
              color: Colors.black12,
              child: const Text("加载中。。。。。"),
            );
          }
        },
      ),
    );
  }
}
