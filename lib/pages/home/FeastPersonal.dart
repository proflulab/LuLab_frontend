import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widget/widgets.dart';
import 'TabBarInFeast.dart';

class FeastPersonal extends StatelessWidget {
  const FeastPersonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: 420.0, //容器的相关参数
            height: 245.0,
            alignment: Alignment.center, //在容器的位置
            child: const VideoView(
              // widget.product.videoUrl,
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              cover:
                  'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
            ),
          ),
        ),
        Positioned(
          top: 210.0,
          // right: 10,
          child: Container(
            //从这里开始
            height: 288,
            width: 360,

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
            radius: 31.0, //参数
          ),
        ),
        Positioned(
          top: 264.0,
          left: 127.0,
          child: SizedBox(
            width: 80.0, //容器的相关参数
            height: 25.0,
            // color: Colors.green,
            child: Image.asset('assets/images/biaoshi.png',
                fit: BoxFit.fill //在容器中如何填充图片
                ),
          ),
        ),
        const Positioned(
          top: 258.0,
          left: 38.0,
          child: SizedBox(
            width: 80.0, //容器的相关参数
            height: 30.0,
            // color: Colors.green,
            child: Text(
              '姓名',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 18.0,
                color: Colors.black,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 300.0,
          left: 25.0,
          child: SizedBox(
            width: 100.0, //容器的相关参数
            height: 25.0,
            // color: Colors.green,
            child: Text(
              '标签标签标签',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 336.0,
          left: 25.0,
          child: SizedBox(
            width: 100.0, //容器的相关参数
            height: 30.0,
            // color: Colors.green,
            child: Text(
              '4130 关注',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 383.0,
          left: 25.0,
          child: SizedBox(
            width: 250.0, //容器的相关参数
            height: 30.0,
            // color: Colors.green,
            child: Text(
              '职能/职能/职能 身份 身份 身份',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 413.0,
          left: 38.0,
          child: SizedBox(
            width: 150.0, //容器的相关参数
            height: 60.0,
            // color: Colors.green,
            child: Text(
              '介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          top: 223.0,
          right: 16.0,
          child: Material(
            child: Ink(
              //设置背景
              decoration: const BoxDecoration(
                //背景
                color: Color.fromRGBO(66, 191, 75, 1),
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              child: InkResponse(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                //点击或者toch控件高亮时显示的控件在控件上层,水波纹下层
//    highlightColor: Colors.deepPurple,
                //点击或者toch控件高亮的shape形状
                highlightShape: BoxShape.rectangle,
                //.InkResponse内部的radius这个需要注意的是，我们需要半径大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
                //水波纹的半径
                radius: 300.0,
                //水波纹的颜色
                splashColor: Colors.yellow,
                //true表示要剪裁水波纹响应的界面 false不剪裁 如果控件是圆角不剪裁的话水波纹是矩形
                containedInkWell: true,
                //点击事件
                onTap: () {
                  if (kDebugMode) {
                    print("click");
                  }
                },
                child: Container(
                    //设置 child 居中
                    alignment: const Alignment(0, 0),
                    height: 25,
                    width: 75,
                    child: Stack(
                      children: const [
                        Positioned(
                          top: 2.0,
                          left: 35.0,
                          child: Text(
                            '关注',
                            style: TextStyle(
                              //文本的相关参数
                              fontSize: 12.0,
                              color: Colors.white,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 4.0,
                            left: 12.0,
                            child: Icon(
                              Icons.local_fire_department_sharp,
                              size: 15,
                              color: Colors.white,
                              textDirection: TextDirection.ltr,
                            )),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
        body: ListView(
      // scrollDirection: Axis.vertical, //纵向滚动
      children: <Widget>[
        Container(
          width: 375.0,
          height: 498.0,
          color: Colors.lightBlue,
          child: stack,
        ),
        Container(
          width: 375.0,
          height: 500.0,
          alignment: Alignment.center,
          child: const AppBardemoPage(),
        ),
      ],
    ));
  }
}
