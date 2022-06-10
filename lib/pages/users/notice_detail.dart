import 'package:flutter/material.dart';

import '../../common/entitys/entitys.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';

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
                margin: EdgeInsets.fromLTRB(
                    PFspace.screenMargin, 15.0, PFspace.screenMargin, 15.0),
                padding: EdgeInsets.all(PFspace.screenMargin),
                decoration: const BoxDecoration(
                  //设置四周圆角 角度
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                        // fontFamily: 'MyFontStyle',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "主讲人：" + widget.product.author,
                      style: const TextStyle(
                        // fontFamily: 'MyFontStyle',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      PFTime.client(widget.product.onlineTime, "ymd"),
                      style: const TextStyle(
                        fontFamily: 'MyFontStyle',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.product.description,
                      style: const TextStyle(
                        // fontFamily: 'MyFontStyle',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    if (widget.product.coverUrl.isNotEmpty)
                      CachedImage.typeLaod(widget.product.coverUrl)
                  ],
                )),
          ],
        ));
  }
}
