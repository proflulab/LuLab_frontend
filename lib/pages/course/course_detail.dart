import 'package:flutter/material.dart';

/// 底部弹起的课程详情

// class CourseDetailPage extends StatelessWidget {
//   const CourseDetailPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CourseDetail(),
//     );
//   }
// }

class CourseDetail extends StatefulWidget {
  final product;
  const CourseDetail({Key? key, required this.product}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text('详情'),
            //     IconButton(
            //         onPressed: () {
            //           Navigator.of(context).pop();
            //         },
            //         icon: const Icon(Icons.keyboard_arrow_down))
            //   ],
            // ),
            const Divider(
              color: Color(0xffe4e4e4),
            ),
            // 详情标题
            buildDetailTitle(),
            // 详情主体
            buildDetailBody(),
            // 课程介绍
            buildCourseDetail(),
            //课程目录
            buildCatalog(),
          ],
        ),
      ),
    );
  }

  Column buildCourseDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Text(
                '课程介绍',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Wrap(
            children: [Text(widget.product.description)],
          ),
        )
      ],
    );
  }

  Container buildDetailTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            widget.product.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Column buildDetailBody() {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          title: Text(
            widget.product.author,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            widget.product.authorTags,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        // // 课程评价
        // ListTile(
        //   leading: const Text(
        //     '课程评价',
        //     style: TextStyle(
        //       color: Colors.grey,
        //     ),
        //   ),
        //   title: Row(
        //     children: const [
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.grey,
        //       ),
        //       Text(
        //         '4.0',
        //         style: TextStyle(color: Colors.grey),
        //       )
        //     ],
        //   ),
        // ),
        // // 播放次数
        // ListTile(
        //   leading: const Text(
        //     '播放次数',
        //     style: TextStyle(
        //       color: Colors.grey,
        //     ),
        //   ),
        //   title: Row(
        //     children: const [
        //       Text(
        //         '989次播放',
        //         style: TextStyle(color: Colors.grey),
        //       )
        //     ],
        //   ),
        // ),
        // // 上线时间
        // ListTile(
        //   leading: const Text(
        //     '上线时间',
        //     style: TextStyle(
        //       color: Colors.grey,
        //     ),
        //   ),
        //   title: Row(
        //     children: const [
        //       Text(
        //         '2021年7月9日上线',
        //         style: TextStyle(color: Colors.grey),
        //       )
        //     ],
        //   ),
        // ),
        // 课程标签
        ListTile(
          leading: Text(
            widget.product.classTags,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '颠覆式创新',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '公司',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 目录
  Column buildCatalog() {
    return Column(
      children: [
        const Text(
          '课程目录',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green,
              fontFamily: 'MyFontStyle',
              fontSize: 20,
              fontWeight: FontWeight.w500),
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
