// import 'package:flutter/material.dart';

// import 'course_detail.dart';

// // class CourseDescPage extends StatelessWidget {
// //   final title;
// //
// //   const CourseDescPage({Key? key, required this.title}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       body: CourseDesc(),
// //     );
// //   }
// // }
// class CourseDescPage extends StatefulWidget {
//   final title;
//   const CourseDescPage({Key? key, required this.title}) : super(key: key);

//   @override
//   _CourseDescPageState createState() => _CourseDescPageState();
// }

// class _CourseDescPageState extends State<CourseDescPage> {
//   @override
//   Widget build(BuildContext context) {
//     return CourseDesc(product: widget.title);
//   }
// }

// class CourseDesc extends StatefulWidget {
//   final product;
//   const CourseDesc({Key? key, required this.product}) : super(key: key);

//   @override
//   _CourseDescState createState() => _CourseDescState();
// }

// class _CourseDescState extends State<CourseDesc> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: [
//         // 简介
//         buildDesc(context),
//         const SizedBox(
//           height: 100,
//           child: Text(''),
//         ),
//         // 收藏、缓存、分享
//         // buildFavDownShare(),
//         // Text(widget.product.title)
//         // 目录
//         // buildCatalog(),
//       ],
//     );
//   }

//   // SizedBox buildDesc(context) {
//   //   return SizedBox(height: 1000, child: CourseDetail(product: widget.product)
//         // child: Column(
//         //   children: [
//         //     // ListTile(
//         //     //   title: Text('颠覆式创新'),
//         //     //   subtitle: Text('陆向谦 实验室创始人\n 2021年7月9日上线 989次播放'),
//         //     // ),
//         //     ExpansionPanelPage(),
//         //     // ListTile(
//         //     //   title: Text('清华大学，介绍。。。'),
//         //     //   // trailing: Icon(Icons.keyboard_arrow_right_sharp),
//         //     //   trailing: IconButton(
//         //     //       onPressed: () {
//         //     //         bounceBottomSheet(context, CourseDetail());
//         //     //       },
//         //     //       icon: Icon(
//         //     //         Icons.keyboard_arrow_right,
//         //     //       )),
//         //     // )
//         //   ],
//         // ),
//         );
//   }

// // 收藏下载分享
// //   Row buildFavDownShare() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //       children: const [
// //         Icon(
// //           Icons.star,
// //           size: 22,
// //           color: Colors.grey,
// //         ),
// //         Icon(
// //           Icons.download,
// //           size: 22,
// //           color: Colors.grey,
// //         ),
// //         Icon(
// //           Icons.share,
// //           size: 22,
// //           color: Colors.grey,
// //         ),
// //       ],
// //     );
// //   }

// // // 目录
// //   Column buildCatalog() {
// //     return Column(
// //       children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             Text(
// //               widget.product.title,
// //               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
// //             ),
// //           ],
// //         ),
// //         SizedBox(
// //             height: 500,
// //             child: ListView.builder(
// //               itemCount: 30,
// //               itemBuilder: (BuildContext context, int index) => ListTile(
// //                 title: Text('第${index + 1}节：大公司被颠覆的底层原因\n25分钟'),
// //               ),
// //             )),
// //       ],
// //     );
// //   }
// }

// // 底部弹起新页面
// // void bounceBottomSheet(BuildContext context, Widget bouncePage) {
// //   showBottomSheet(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return bouncePage;
// //       });
// // }
