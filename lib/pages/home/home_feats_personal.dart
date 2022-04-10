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
  bool mIsExpansion = false;

  //最大显示行数（默认 3 行）
  int mMaxLine = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: ListView(
        children: <Widget>[
          _img(),
          _profileInfo(),
          SizedBox(height: 15.w),
          _experience(),
        ],
      ),
    );
  }

  _img() {
    return Container(
      height: 250.h,
      margin: EdgeInsets.only(
        left: PFspace.screenMargin,
        right: PFspace.screenMargin,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.w)),
      ),
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: 180.h,
              //width: MediaQuery.of(context).size.width,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.w),
                ),
                child: CachedImage.typeLaod(widget.product.profileImgUrl),
              ),
            ),
          ),
          Positioned(
            top: 170.h,
            right: 40.w,
            child: RawChip(
              label: const Text('视频介绍'),
              onDeleted: () {},
              deleteIcon: const Icon(Icons.play_circle_filled_rounded),
              deleteIconColor: Colors.red,
              deleteButtonTooltipMessage: '播放',
            ),
          ),
          Positioned(
            width: 140.w,
            height: 140.w,
            top: 140.h,
            left: 20.w,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: PFc.backgroundSecondary,
                borderRadius: BorderRadius.all((Radius.circular(70.w))),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(75.w),
                ),
                child: CachedImage.typeLaod(widget.product.profileImgUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _profileInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      padding: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.w)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.product.name),
              SizedBox(width: 5.w),
              Icon(widget.product.sex == "1" ? Icons.boy : Icons.girl),
            ],
          ),
          SizedBox(height: 15.w),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                ),
                child: Row(
                  children: const [Text("特斯拉"), Icon(Icons.done)],
                ),
              ),
              SizedBox(width: 5.w),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                ),
                child: Row(
                  children: const [Text("高管"), Icon(Icons.done)],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.w),
          Row(
            children: [
              const Text("所在位置"),
              SizedBox(width: 5.w),
              Text(widget.product.location[0] +
                  "·" +
                  widget.product.location[1]),
            ],
          ),
          SizedBox(height: 15.w),
          Row(
            children: [
              const Text("家      乡"),
              SizedBox(width: 5.w),
              Text(widget.product.homeTown[0] +
                  "·" +
                  widget.product.homeTown[1]),
            ],
          ),
          const Divider(),
          richText(widget.product.detailMsg),
        ],
      ),
    );
  }

  _experience() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: PFspace.screenMargin),
      padding: EdgeInsets.all(PFspace.screenMargin),
      decoration: BoxDecoration(
        color: PFc.backgroundSecondary,
        borderRadius: BorderRadius.all(Radius.circular(25.w)),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("个人经历"),
          Row(
            children: [
              const Icon(Icons.add_location_alt_rounded),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("销售总监"),
                  Text("陆向谦实验室"),
                  Text("2018.12-至今（4年7个月）"),
                  Text("经历经历经历经历经历经历经历经历经历经历经历"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  //_text：显示的文字
  Widget richText(String _text) {
    if (isExpansion(_text)) {
      //如果需要截断
      if (mIsExpansion) {
        return Column(
          children: <Widget>[
            Text(
              _text,
              textAlign: TextAlign.left,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  _isShowText();
                },
                child: const Text("<收起"),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            Text(
              _text,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  _isShowText();
                },
                child: const Text("全文>"),
              ),
            ),
          ],
        );
      }
    } else {
      return Text(
        _text,
        maxLines: 3,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  bool isExpansion(String text) {
    TextPainter _textPainter = TextPainter(
      maxLines: 3,
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 1.sw, minWidth: 1.sw);
    if (_textPainter.didExceedMaxLines) {
      //这里判断 文本是否截断
      return true;
    } else {
      return false;
    }
  }

  void _isShowText() {
    if (mIsExpansion) {
      //关闭了
      setState(
        () {
          mIsExpansion = false;
        },
      );
    } else {
      setState(
        () {
          mIsExpansion = true;
        },
      );
    }
  }
}

class $ {}



// class FeastPersonal extends StatefulWidget {
//   const FeastPersonal({Key? key, required this.product}) : super(key: key);
//   final LatestClassificationUser product;

//   @override
//   _FeastPersonalState createState() => _FeastPersonalState();
// }

// class _FeastPersonalState extends State<FeastPersonal> {
//   late final model = widget.product;
//   var a = 1.sw;
//   var b = 1.sh;
//   @override
//   Widget build(BuildContext context) {
//     var stack = Stack(
//       children: <Widget>[
//         Positioned(
//           child: Container(
//             width: PFspace.screenW,
//             height: PFspace.screenW * PFr.ratio9_16,
//             alignment: Alignment.center, //在容器的位置
//             child: VideoView(
//               widget.product.videos[1],
//               //'https://media.w3.org/2010/05/sintel/trailer.mp4',
//               cover: 'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
//             ),
//           ),
//         ),
//         Positioned(
//           top: a * 9 / 16,
//           // right: 10,
//           child: Container(
//             //从这里开始
//             height: b - a * 9 / 16,
//             width: 750.w,
//             decoration: const BoxDecoration(
//               //背景
//               color: Colors.white,
//               //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//             ),
//           ),
//         ),
//         Positioned(
//           top: a * 9 / 16 - 20,
//           left: 25.0,
//           child: CircleAvatar(
//             //底层的组件
//             backgroundImage: NetworkImage(widget.product.imgUrl),
//             radius: 40.0, //参数
//           ),
//         ),
//         Positioned(
//           top: 230.0,
//           left: 220.0,
//           child: SizedBox(
//             width: 200.0.w, //容器的相关参数
//             height: 100.0.h,
//             // color: Colors.green,
//             child: Text(
//               widget.product.name,
//               style: const TextStyle(
//                 fontFamily: 'MyFontStyle',
//                 color: Colors.black,
//                 fontSize: 30,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 270.0,
//           left: 210.0,
//           child: SizedBox(
//             width: 200.0.w, //容器的相关参数
//             height: 100.0.h,
//             // color: Colors.green,
//             child: Text(
//               widget.product.identity,
//               style: const TextStyle(
//                 fontFamily: 'MyFontStyle',
//                 color: Colors.black,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 330.0,
//           left: 38.0,
//           child: SizedBox(
//             width: 800.0.w, //容器的相关参数
//             height: 200.0.h,
//             // color: Colors.green,
//             child: Text(
//               widget.product.description,
//               style: const TextStyle(
//                 fontFamily: 'MyFontStyle',
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//     return Scaffold(
//       appBar: PreferredSize(
//         //设置appBar高度
//         preferredSize: const Size.fromHeight(0),
//         child: AppBar(),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             width: 375.0.w,
//             height: 1.sh,
//             color: Colors.grey,
//             child: stack,
//           ),
//           // Container(
//           //   width: 375.0.w,
//           //   height: 500.0.h,
//           //   alignment: Alignment.center,
//           //   child: const AppBardemoPage(),
//           // ),
//         ],
//       ),
//     );
//   }
// }
