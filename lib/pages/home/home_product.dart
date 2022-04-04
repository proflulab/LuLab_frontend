import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proflu/common/api/gql_home.dart';
import 'package:proflu/common/values/ratio.dart';
import 'package:proflu/common/values/size_spacing.dart';
import 'package:proflu/common/widget/positioned_widget.dart';
import 'package:proflu/pages/home/home_product_detail.dart';

import '../../common/entitys/entitys.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late LatestTraining _latestTraining;
  List<LatestTrainingElement> _focusData = [];

  @override
  void initState() {
    super.initState();
    _loadProductData();
  }

  _loadProductData() async {
    _latestTraining = await GqlHomeAPI.latestTainingInfo(context: context);

    if (mounted) {
      setState(() {
        _focusData = _latestTraining.latestTraining;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _focusData.length,
      itemBuilder: (BuildContext context, int index) {
        if (_focusData.isNotEmpty) {
          double _boxw = (1.sw - PFspace.screenMargin * 2);
          double _boxh = _boxw * PFr.golden;
          return InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    product: _focusData[index],
                  ),
                ),
              );
            },
            child: SizedBox(
              height: _boxh,
              width: _boxw,
              child: Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                alignment: const Alignment(0, 0),
                height: 300.h,
                width: 690.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ),
                child: Stack(
                  children: <Widget>[
                    // 课程封面
                    positionedImage(
                      context: context,
                      top: 0.h,
                      right: 0.w,
                      height: 200.h,
                      width: 300.w,
                      url: _focusData[index].imgUrl,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        topLeft: Radius.circular(25.r),
                      ),
                    ),
                    Container(
                      height: 300.h,
                      width: 690.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.r)),
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.red.withOpacity(0.1),
                            Colors.red.withOpacity(0.15),
                            Colors.red.withOpacity(0.2),
                            Colors.red.withOpacity(0.25),
                            Colors.red.withOpacity(0.3),
                            Colors.red.withOpacity(0.35),
                            Colors.red.withOpacity(0.4),
                            Colors.red.withOpacity(0.45),
                            Colors.red.withOpacity(0.5),
                            Colors.red.withOpacity(0.55),
                            Colors.red.withOpacity(0.6),
                            Colors.red.withOpacity(0.65),
                            Colors.red.withOpacity(0.7),
                            Colors.red.withOpacity(0.75),
                            Colors.red.withOpacity(0.8),
                            Colors.red.withOpacity(0.85),
                            Colors.red.withOpacity(0.9),
                            Colors.red.withOpacity(0.95),
                            Colors.red.withOpacity(1.0),
                            Colors.red.withOpacity(1.0),
                            Colors.red.withOpacity(1.0),
                            Colors.red.withOpacity(1.0),
                          ],
                        ),
                      ),
                    ),
                    positioningText(
                      context: context,
                      top: 50.h,
                      left: 50.w,
                      width: 370.w,
                      height: 50.h,
                      text: _focusData[index].name, //最多60字
                      fontSize: 20,
                      color: Colors.white,
                      font: "",
                    ),
                    positioningText(
                      context: context,
                      top: 100.h,
                      left: 50.w,
                      width: 370.w,
                      height: 50.h,
                      text: _focusData[index].description, //最多60字
                      fontSize: 13,
                      color: Colors.white,
                      font: "",
                    ),
                    Positioned(
                      top: 200.h,
                      child: Container(
                        height: 100.h,
                        width: 690.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.r),
                              bottomRight: Radius.circular(25.r)),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 120.w, right: 120.w, top: 20.h),
                          height: 50.h,
                          width: 300.w,
                          child: Text(
                            _focusData[index].trait,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: '',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                  Text('正在加载......')
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
