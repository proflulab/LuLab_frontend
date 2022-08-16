import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widget/my_appbar.dart';

class VipDetail extends StatefulWidget {
  const VipDetail({Key? key}) : super(key: key);

  @override
  State<VipDetail> createState() => _VipDetailState();
}

class _VipDetailState extends State<VipDetail> {
  @override
  //显示底部弹框的功能
  void showBottomSheet() {
    //用于在底部打开弹框的效果
    showModalBottomSheet(
        builder: (BuildContext context) {
          //构建弹框中的内容
          return buildBottomSheetWidget(context);
        },
        context: context);
  }

  Widget buildBottomSheetWidget(BuildContext context) {
    //弹框中内容  310 的调试
    return Container(
      height: 300.h,
      width: 1.sw,
      child: const Text('放选择按钮等'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "会员",
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            width: 1.sw, //参数，控制每一个容器的高度等等
            height: 1.sh,
            child: Image.network(''),
          ),
          ElevatedButton(
            onPressed: () {
              showBottomSheet();
            },
            child: Text('开通'),
          ),
        ],
      ),
    );
  }
}
