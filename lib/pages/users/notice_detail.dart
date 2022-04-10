import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proflu/common/utils/time.dart';

import '../../common/entitys/entitys.dart';
//import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';

class NoticeDetail extends StatefulWidget {
  const NoticeDetail({Key? key, required this.product}) : super(key: key);
  final LatestRecordElement product;
  @override
  State<NoticeDetail> createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var height = (_focusData.description.length / 15) * 50.h;

    return Scaffold(
      appBar: appBarCommon(context: context, title: widget.product.title),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
            decoration: const BoxDecoration(
              //设置四周圆角 角度
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 150.h + 100,
            width: 690.w,
            // color: Colors.white,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 20.0.h,
                  left: 45.0.w,
                  child: SizedBox(
                    width: 690.0.w, //容器的相关参数
                    height: 80.0.h,
                    // color: Colors.green,
                    child: Text(
                      widget.product.title,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 70.0.h,
                  left: 45.0.w,
                  child: SizedBox(
                    width: 690.0.w, //容器的相关参数
                    height: 80.0.h,
                    // color: Colors.green,
                    child: Text(
                      "主讲人：" + widget.product.author,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),
                ),
                Positioned(
                  top: 110.0.h,
                  left: 45.0.w,
                  child: SizedBox(
                    width: 690.0.w, //容器的相关参数
                    height: 80.0.h,
                    // color: Colors.green,
                    child: Text(
                      TimeChange.client(widget.product.onlineTime, "ymd"),
                      style: const TextStyle(
                        fontFamily: 'MyFontStyle',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150.0.h,
                  left: 30.0.w,
                  child: SizedBox(
                    width: 634.0.w, //容器的相关参数
                    height: 100,
                    child: Text(
                      widget.product.description,
                      style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
