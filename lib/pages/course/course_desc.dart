import 'package:flutter/material.dart';

import 'course_expansionpanelpage.dart';

class CourseDescPage extends StatelessWidget {
  const CourseDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CourseDesc(),
    );
  }
}

class CourseDesc extends StatelessWidget {
  const CourseDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        // 简介
        buildDesc(context),
        // 收藏、缓存、分享
        buildFavDownShare(),
        // 目录
        // buildCatalog(),
      ],
    );
  }

  SizedBox buildDesc(context) {
    return const SizedBox(
      height: 1200,
      child: ExpansionPanelPage(),
      // child: Column(
      //   children: [
      //     // ListTile(
      //     //   title: Text('颠覆式创新'),
      //     //   subtitle: Text('陆向谦 实验室创始人\n 2021年7月9日上线 989次播放'),
      //     // ),
      //     ExpansionPanelPage(),
      //     // ListTile(
      //     //   title: Text('清华大学，介绍。。。'),
      //     //   // trailing: Icon(Icons.keyboard_arrow_right_sharp),
      //     //   trailing: IconButton(
      //     //       onPressed: () {
      //     //         bounceBottomSheet(context, CourseDetail());
      //     //       },
      //     //       icon: Icon(
      //     //         Icons.keyboard_arrow_right,
      //     //       )),
      //     // )
      //   ],
      // ),
    );
  }

// 收藏下载分享
  Row buildFavDownShare() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(
          Icons.star,
          size: 22,
          color: Colors.grey,
        ),
        Icon(
          Icons.download,
          size: 22,
          color: Colors.grey,
        ),
        Icon(
          Icons.share,
          size: 22,
          color: Colors.grey,
        ),
      ],
    );
  }

// 目录
  Column buildCatalog() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              '目录',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text('第${index + 1}节：大公司被颠覆的底层原因\n25分钟'),
              ),
            )),
      ],
    );
  }
}

// 底部弹起新页面
// void bounceBottomSheet(BuildContext context, Widget bouncePage) {
//   showBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return bouncePage;
//       });
// }
