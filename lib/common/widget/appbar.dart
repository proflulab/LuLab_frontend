import 'package:flutter/material.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';

// 透明背景AppBar
Widget transparentAppBar({
  required BuildContext context,
  required Widget title,
  required Widget leading,
  required List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}

//AppBarCommon
PreferredSizeWidget appBarCommon({
  required BuildContext context,
  required String title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(PFspace.screenH * 0.1),
    child: AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'MyFontStyle',
          color: PFc.textEmphasis,
          fontSize: 24,
        ),
      ),
      leading: leading,
      actions: actions,
    ),
  );
}

//搜索AppBar
PreferredSizeWidget appBarSeach({
  required BuildContext context,
  //搜索框执行内容
  required GestureTapCallback? onTap,
  //Icon执行内容
  required VoidCallback? onPressed,
  //Icon
  required IconData? icon,
}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: InkWell(
      onTap: onTap,
      // () {
      //   Navigator.pushNamed(context, '/search');
      // },
      child: Container(
        height: 50.h,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          //改变搜索外框颜色
          border: Border.all(color: Colors.black),
          color: const Color.fromRGBO(230, 230, 230, 0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: const <Widget>[
          Icon(
            Icons.search,
            color: (Color.fromRGBO(89, 89, 89, 1)),
          ),
          Text(
            "开始搜索",
            //textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(89, 89, 89, 1),
              fontSize: 15,
            ),
          )
        ]),
      ),
    ),
    actions: [
      IconButton(
        onPressed: onPressed,
        // () {
        //   Navigator.pushNamed(context, '/history');
        // },
        icon: Icon(
          icon,
          //Icons.history,
          color: const Color.fromRGBO(117, 117, 117, 1),
        ),
      )
    ],
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = PFc.secondaryElement}) {
  return Container(
    height: 10,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
