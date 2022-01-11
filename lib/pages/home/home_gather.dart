import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../utils/utils.dart';

class Gather extends StatefulWidget {
  const Gather({Key? key}) : super(key: key);

  @override
  _GatherState createState() => _GatherState();
}

class _GatherState extends State<Gather> {
  //轮播图
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://i03piccdn.sogoucdn.com/a8c779e94bd78aed"},
      {"url": "https://i01piccdn.sogoucdn.com/39b671bca8fc928c"},
      {"url": "https://i02piccdn.sogoucdn.com/44c83a326173f013"},
    ];

    return AspectRatio(
      aspectRatio: 5 / 2,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imgList[index]["url"],
            fit: BoxFit.fill,
          );
        },
        //条目个数
        itemCount: imgList.length,
        //轮播指示符
        //control: new SwiperControl(),
        //分页指示器
        pagination: buildSwiperPagination(),
        //自动翻页
        autoplay: true,
        onTap: (index) {
          if (kDebugMode) {
            print(" 点击 " + index.toString());
          }
        },
      ),
    );
  }

  //自定圆点分页指示器
  buildSwiperPagination() {
    // 分页指示器
    return const SwiperPagination(
      //指示器显示的位置
      alignment: Alignment.bottomCenter, // 位置 Alignment.bottomCenter 底部中间
      // 距离调整
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      // 指示器构建
      builder: DotSwiperPaginationBuilder(
          // 点之间的间隔
          space: 8,
          // 没选中时的大小
          size: 6,
          // 选中时的大小
          activeSize: 12,
          // 没选中时的颜色
          color: Colors.white,
          //选中时的颜色
          activeColor: Colors.blue),
    );
  }

  Widget _titleWidget(value) {
    return Container(
      height: fitHeight(32),
      margin: EdgeInsets.only(left: fitWidth(20)),
      padding: EdgeInsets.only(left: fitWidth(20)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.blue,
        width: fitWidth(20),
      ))),
      child: Text(
        value,
        style: const TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _hotProductListWidget() {
    return Container(
      height: 100.0,
      width: 400.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: ListTile(
        leading: Image.network(
            'https://p2.itc.cn/q_70/images03/20210821/11edfd2d54b6492ea3af068c0762b801.jpeg'),
        title: const Text('案例课直播  学理论不如学案例'),
        subtitle: const Text('介绍：'),
        trailing: TextButton(
          autofocus: true,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          child: const Text(
            "预约",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  //推荐

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _swiperWidget(),
        SizedBox(height: fitHeight(20)),
        _titleWidget("课程预约"),
        SizedBox(height: fitHeight(20)),
        _hotProductListWidget(),
        SizedBox(height: fitHeight(20)),
        _titleWidget("免费体验"),
        _buildFreeCourse(),
        SizedBox(height: fitHeight(20)),
        _titleWidget("精彩课程"),
        buildWonderCourse(),
      ],
    );
  }

// 免费体验课程
  SingleChildScrollView _buildFreeCourse() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
          _buildEachFreeCourse(),
        ],
      ),
    );
  }

// 每个免费课程
  Container _buildEachFreeCourse() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            // 课程图片
            width: 100,
            height: 150,
            child: Image.asset('assets/images/logo.png'),
          ),
          const Text(
            'AI时代——造就...',
            style: TextStyle(color: Color(0xff404040)),
          ),
          const Text(
            '播放量130万',
            style: TextStyle(
              color: Color(0xffffcd92),
            ),
          ),
        ],
      ),
    );
  }

// 精彩课程
  SingleChildScrollView buildWonderCourse() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildEachCourse(),
          buildEachCourse(),
          buildEachCourse(),
          buildEachCourse(),
        ],
      ),
    );
  }

// 每个课程
  Container buildEachCourse() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        leading: Container(
          width: 100,
          child: Image.asset('assets/images/logo.png'),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffc3c3c3)),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        title: const Text("颠覆式创新"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [Text("陆向谦  实验室创始人"), Text("介绍。。。")],
        ),
      ),
    );
  }
}
