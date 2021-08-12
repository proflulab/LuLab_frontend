import 'package:flutter/material.dart';
import 'search_bar.dart';
import 'bottom_bar.dart';

/// Page管理器

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 顶部搜索框
          SearchBarPage(),
        ],
      ),
      // 底部导航栏
      bottomNavigationBar: BotomeMenumBarPage(),
    );
  }
}
