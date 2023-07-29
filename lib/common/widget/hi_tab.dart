import 'package:flutter/material.dart';

///顶部tab切换组件
class HiTab extends StatelessWidget {
  final List<Widget> tabs;
  final TabController controller;
  final double fontSize;
  final double borderWidth;
  final double insets;
  final Color unselectedLabelColor;
  final Color indicatorColor;
  final double indicatorWeight;
  final EdgeInsetsGeometry indicatorPadding;

  const HiTab(
    this.tabs, {
    Key? key,
    required this.controller,
    this.fontSize = 20,
    this.borderWidth = 2,
    this.insets = 15,
    this.unselectedLabelColor = Colors.grey,
    this.indicatorColor = Colors.green,
    this.indicatorWeight = 3,
    this.indicatorPadding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      labelColor: Colors.green,
      unselectedLabelColor: unselectedLabelColor,
      indicatorColor: indicatorColor,
      indicatorWeight: indicatorWeight,
      indicatorPadding: const EdgeInsets.only(right: 4, left: 10, bottom: 3),
      labelStyle: TextStyle(
        fontFamily: "MyFontStyle",
        fontSize: fontSize,
      ),
      tabs: tabs,
    );
  }
}
