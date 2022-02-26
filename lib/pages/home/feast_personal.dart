import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';

import 'tab_barin_feast.dart';

class FeastPersonal extends StatefulWidget {
  const FeastPersonal({Key? key, required this.product}) : super(key: key);
  final product;

  @override
  _FeastPersonalState createState() => _FeastPersonalState();
}

class _FeastPersonalState extends State<FeastPersonal> {
  late final model = widget.product;
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: 800.0.w, //容器的相关参数
            height: 380.0.h,
            alignment: Alignment.center, //在容器的位置
            child: Image.network(
              'https://scpic2.chinaz.net/Files/pic/pic9/202108/bpic23941.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 210.0,
          // right: 10,
          child: Container(
            //从这里开始
            height: 650.h,
            width: 750.w,

            decoration: const BoxDecoration(
              //背景
              color: Colors.white,
              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
          ),
        ),
        const Positioned(
          top: 195.0,
          left: 25.0,
          child: CircleAvatar(
            //底层的组件
            backgroundImage: NetworkImage(
                'https://up.enterdesk.com/edpic/f9/50/b0/f950b0aa078f3a0be7ba87f46a43705a.jpg'),
            radius: 50.0, //参数
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
                  fontFamily: 'MyFontStyle', color: Colors.black, fontSize: 30),
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
                  fontFamily: 'MyFontStyle', color: Colors.black, fontSize: 18),
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
            child: Text(widget.product.description,
                style:
                    const TextStyle(fontFamily: 'MyFontStyle', fontSize: 18)),
          ),
        ),
      ],
    );
    return Scaffold(
        body: ListView(
      // scrollDirection: Axis.vertical, //纵向滚动
      children: <Widget>[
        Container(
          width: 375.0.w,
          height: 1000.0.h,
          color: Colors.grey,
          child: stack,
        ),
        Container(
          width: 375.0.w,
          height: 500.0.h,
          alignment: Alignment.center,
          child: const AppBardemoPage(),
        ),
      ],
    ));
  }
}
