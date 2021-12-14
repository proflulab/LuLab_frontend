import 'package:flutter/material.dart';

import '../../api/apis.dart';
import '../../entitys/entitys.dart';
import '../../widget/widgets.dart';
import '../../utils/utils.dart';

import 'infor_details.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key? key}) : super(key: key);

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
      this._focusData = focusList;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("资讯"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _focusData.length,
          itemBuilder: (context, index) {
            if (this._focusData.length > 0) {
              return InkWell(
                onTap: () async {
                  print('到课程详情');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              new InforDetails(product: _focusData[index])));
                },
                child: Container(
                  height: 170.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  margin:
                      EdgeInsets.only(bottom: 10.h, left: 30.w, right: 30.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Stack(
                    children: <Widget>[
                      // 资讯封面
                      positionedImage(
                          context: context,
                          top: 10,
                          left: 10,
                          height: 150,
                          width: 150,
                          url:
                              'https://image2.cnpp.cn/upload/images/20210427/17584971448_207x90.gif'),
                      // 资讯标题
                      positionedText(
                          context: context,
                          top: 30,
                          left: 180,
                          height: 30,
                          width: 500,
                          text: _focusData[index].title),
                      // 观看次数
                      positionedText(
                          context: context,
                          top: 60,
                          left: 180,
                          height: 40,
                          width: 200,
                          text: "test"),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                height: 100,
                width: 200,
                color: Colors.black12,
                child: Text("加载中。。。。。"),
              );
            }
          },
        ),
      ),
    );
  }
}
