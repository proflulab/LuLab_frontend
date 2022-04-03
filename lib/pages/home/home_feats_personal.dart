import 'package:flutter/material.dart';

import '../../common/values/values.dart';
import '../../common/utils/utils.dart';
//import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/widget/widgets.dart';

// import 'tab_barin_feast.dart';

class FeastPersonal extends StatefulWidget {
  const FeastPersonal({Key? key, required this.product}) : super(key: key);
  final LatestClassificationUser product;

  @override
  _FeastPersonalState createState() => _FeastPersonalState();
}

class _FeastPersonalState extends State<FeastPersonal> {
  late final model = widget.product;
  var a = 1.sw;
  var b = 1.sh;
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: PFspace.screenW,
            height: PFspace.screenW * PFr.ratio9_16,
            alignment: Alignment.center, //在容器的位置
            child: VideoView(
              widget.product.videos[1],
              //'https://media.w3.org/2010/05/sintel/trailer.mp4',
              cover: 'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
            ),
          ),
        ),
        Positioned(
          top: a * 9 / 16,
          // right: 10,
          child: Container(
            //从这里开始
            height: b - a * 9 / 16,
            width: 750.w,
            decoration: const BoxDecoration(
              //背景
              color: Colors.white,
              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
          ),
        ),
        Positioned(
          top: a * 9 / 16 - 20,
          left: 25.0,
          child: CircleAvatar(
            //底层的组件
            backgroundImage: NetworkImage(widget.product.imgUrl),
            radius: 40.0, //参数
          ),
        ),
        Positioned(
          top: 230.0,
          left: 220.0,
          child: SizedBox(
            width: 200.0.w, //容器的相关参数
            height: 100.0.h,
            // color: Colors.green,
            child: Text(
              widget.product.name,
              style: const TextStyle(
                fontFamily: 'MyFontStyle',
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: 270.0,
          left: 210.0,
          child: SizedBox(
            width: 200.0.w, //容器的相关参数
            height: 100.0.h,
            // color: Colors.green,
            child: Text(
              widget.product.identity,
              style: const TextStyle(
                fontFamily: 'MyFontStyle',
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Positioned(
          top: 330.0,
          left: 38.0,
          child: SizedBox(
            width: 800.0.w, //容器的相关参数
            height: 200.0.h,
            // color: Colors.green,
            child: Text(
              widget.product.description,
              style: const TextStyle(
                fontFamily: 'MyFontStyle',
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: PreferredSize(
        //设置appBar高度
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: 375.0.w,
            height: 1.sh,
            color: Colors.grey,
            child: stack,
          ),
          // Container(
          //   width: 375.0.w,
          //   height: 500.0.h,
          //   alignment: Alignment.center,
          //   child: const AppBardemoPage(),
          // ),
        ],
      ),
    );
  }
}
