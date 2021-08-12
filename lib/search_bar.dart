import 'package:flutter/material.dart';

/// 顶部搜索框
class SearchBarPage extends StatelessWidget {
  const SearchBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: 30,
      decoration: BoxDecoration(
          // 圆角边框
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // 搜索图标
            child: Icon(
              Icons.search,
              color: Color.fromRGBO(197, 201, 206, 1),
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            // 框内提示文字
            child: Text(
              "提示搜索文案",
              style: TextStyle(color: Color.fromRGBO(197, 201, 206, 1)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
