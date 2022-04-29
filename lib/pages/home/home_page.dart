import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/values/values.dart';
import 'home_feats.dart';
import 'home_gather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: const HomePageList(),
        appBar: PreferredSize(
          //设置appBar高度
          preferredSize: const Size.fromHeight(60),
          child: Blur(
            blur: 10,
            // blurColor: Colors.red,
            colorOpacity: 0.1,
            child: Container(color: Colors.transparent),
            overlay: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              bottom: const TabBar(
                tabs: [
                  Tab(text: "推荐区"),
                  Tab(text: "功勋园"),
                  //TODO 训练营产品取消，后续修改为会员申请入口
                  //Tab(text: "训练营"),
                ],
                //文字选中颜色
                labelColor: PFc.themeColor,
                //文字未选中颜色
                unselectedLabelColor: PFc.textPrimary,
                //文字选中样式
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MyFontStyle',
                  fontSize: 20,
                ),
                //文字未选中样式
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  //fontFamily: 'MyFontStyle2',
                  fontSize: 15,
                ),
                //设置线条的颜色
                indicatorColor: PFc.themeColor,
                //设置线条的粗细
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.only(
                  right: 40,
                  left: 40,
                  bottom: 3,
                ),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageList extends StatefulWidget {
  const HomePageList({Key? key}) : super(key: key);

  @override
  _HomePageListState createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Center(child: Gather()),
        Center(child: FeatsPage()),
        //Center(child: Product())
      ],
    );
  }
}
