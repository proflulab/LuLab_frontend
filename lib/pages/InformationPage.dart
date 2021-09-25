import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Container(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Text('咨讯')],
          ),
        ),

        // 左侧返回按钮，可以有按钮，可以有文字

        backgroundColor: Colors.blue, //导航栏和状态栏的的颜色
        centerTitle: true, //标题是否居中，默认为false
        toolbarOpacity: 1, //整个导航栏的不透明度
      ),
      body: new ListView(children: <Widget>[
        //开始添加页面内容
//           Container(
//             width: 500.0, //容器的相关参数
//             height: 280.0,
//             color: Colors.lightBlue,
//             //child在容器的位置
//             child: new IconButton(
//                 icon: const Icon(
//                   IconData(0xe813, fontFamily: 'MyIcons'),
//                   size: 100.0,
//                 ),
//                 tooltip: '点击进入每日晨报',
//                 onPressed: () {
//                   print('');
//                 }),

// //容器内的文字，大小，颜色等参数
//           ),
        Container(
            width: 500.0, //容器的相关参数
            height: 280.0,
            child: new ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Container(
                      width: 415.0,
                      child: RaisedButton(
                        child: new Image.network(
                            'https://img.36krcdn.com/20210922/v2_fdaa1ae1bafa4fcc9f5e14038ec673f3_img_jpg',
                            fit: BoxFit.fill), //child：可以放入容器，图标，文字。让你构建多彩的按钮。
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new SecondScreen()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
                              );
                        },
                      )),
                  new Container(
                      width: 415.0,
                      child: new Image.network(
                          'https://img.36krcdn.com/20210923/v2_e9d54d58e2a94eca9357b41306862951_img_000',
                          fit: BoxFit.fill)),
                  new Container(
                      width: 415.0,
                      child: new Image.network(
                          'https://img.36krcdn.com/20210922/v2_b25cf9f0b37d42b09403ded0460bcd28_img_000',
                          fit: BoxFit.fill)),
                  new Container(
                      width: 415.0,
                      child: new Image.network(
                          'https://img.36krcdn.com/20210923/v2_edbf3e6567a244f9b230199894b9ea00_img_000',
                          fit: BoxFit.fill)),
                ])),
        Container(
            width: 375.0, //容器的相关参数
            height: 130.0,
            color: Colors.white,
            child: Stack(
              children: [
                new Positioned(
                    top: 18,
                    left: 15,
                    right: 135,
                    child: new Text('关于虚拟的“数字人类”，你需要了解这些事情',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                        ))),
                new Positioned(
                    top: 20,
                    right: 12,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 85,
                    right: 130,
                    child: Container(
                        width: 100,
                        height: 22,
                        child: RaisedButton(
                          child: new Text('查看详情',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.blue,
                              )), //child：可以放入容器，图标，文字。让你构建多彩的按钮。
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new SecondScreen()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
                                );
                          },
                        ))),
                new Positioned(
                    top: 93,
                    left: 15,
                    child: Container(
                        width: 18,
                        height: 13,
                        child: new Image.asset('assets/image/眼睛.png'))),
                new Positioned(
                    top: 88,
                    left: 37,
                    child: new Text('11235人浏览过',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))),
              ],
            )),
        Container(
            width: 375.0, //容器的相关参数
            height: 130.0,
            color: Colors.white,
            child: Stack(
              children: [
                new Positioned(
                    top: 18,
                    left: 15,
                    right: 135,
                    child: new Text('关于虚拟的“数字人类”，你需要了解这些事情',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                        ))),
                new Positioned(
                    top: 20,
                    right: 12,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 93,
                    left: 15,
                    child: Container(
                        width: 18,
                        height: 13,
                        child: new Image.asset('assets/image/眼睛.png'))),
                new Positioned(
                    top: 88,
                    left: 37,
                    child: new Text('11235人浏览过',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))),
              ],
            )),
        Container(
            width: 375.0, //容器的相关参数
            height: 130.0,
            color: Colors.white,
            child: Stack(
              children: [
                new Positioned(
                    top: 18,
                    left: 15,
                    right: 135,
                    child: new Text('关于虚拟的“数字人类”，你需要了解这些事情',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                        ))),
                new Positioned(
                    top: 20,
                    right: 12,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 93,
                    left: 15,
                    child: Container(
                        width: 18,
                        height: 13,
                        child: new Image.asset('assets/image/眼睛.png'))),
                new Positioned(
                    top: 88,
                    left: 37,
                    child: new Text('11235人浏览过',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))),
              ],
            )),
        Container(
            width: 375.0, //容器的相关参数
            height: 130.0,
            color: Colors.white,
            child: Stack(
              children: [
                new Positioned(
                    top: 18,
                    left: 15,
                    right: 135,
                    child: new Text('关于虚拟的“数字人类”，你需要了解这些事情',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                        ))),
                new Positioned(
                    top: 20,
                    right: 12,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 93,
                    left: 15,
                    child: Container(
                        width: 18,
                        height: 13,
                        child: new Image.asset('assets/image/眼睛.png'))),
                new Positioned(
                    top: 88,
                    left: 37,
                    child: new Text('11235人浏览过',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))),
              ],
            )),
        Container(
            width: 375.0, //容器的相关参数
            height: 130.0,
            color: Colors.white,
            child: Stack(
              children: [
                new Positioned(
                    top: 18,
                    left: 15,
                    right: 135,
                    child: new Text('关于虚拟的“数字人类”，你需要了解这些事情',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                        ))),
                new Positioned(
                    top: 20,
                    right: 12,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 93,
                    left: 15,
                    child: Container(
                        width: 18,
                        height: 13,
                        child: new Image.asset('assets/image/眼睛.png'))),
                new Positioned(
                    top: 88,
                    left: 37,
                    child: new Text('11235人浏览过',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))),
              ],
            )),
        Container(
            width: 375.0, //容器的相关参数
            height: 130.0,
            color: Colors.white,
            child: Stack(
              children: [
                new Positioned(
                    top: 18,
                    left: 15,
                    right: 135,
                    child: new Text('关于虚拟的“数字人类”，你需要了解这些事情',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                        ))),
                new Positioned(
                    top: 20,
                    right: 15,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 93,
                    left: 15,
                    child: Container(
                        width: 18,
                        height: 13,
                        child: new Image.asset('assets/image/眼睛.png'))),
                new Positioned(
                    top: 88,
                    left: 37,
                    child: new Text('11235人浏览过',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))),
              ],
            )),
        Container(
            width: 375.0, //容器的相关参数
            height: 190.0,
            color: Colors.white,
            child: Stack(
              children: [
                new Positioned(
                    top: 0,
                    left: 15,
                    child: new Text('亚马逊推Amazon Pay，欲挑战Apple Pay',
                        style: TextStyle(
                          fontSize: 16.0,
                        ))),
                new Positioned(
                    top: 80,
                    left: 15,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 80,
                    right: 15,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 80,
                    right: 147,
                    child: Container(
                        width: 110,
                        height: 90,
                        child: new Image.network(
                            'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg'))),
                new Positioned(
                    top: 51,
                    left: 15,
                    child: Container(
                        width: 18,
                        height: 13,
                        child: new Image.asset('assets/image/眼睛.png',
                            fit: BoxFit.fill))),
                new Positioned(
                    top: 46,
                    left: 37,
                    child: new Text('11235人浏览过',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))),
              ],
            )),
      ]),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Container(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Text('文章详情')],
          ),
        ),

        // 左侧返回按钮，可以有按钮，可以有文字

        backgroundColor: Colors.blue, //导航栏和状态栏的的颜色
        centerTitle: true, //标题是否居中，默认为false
        toolbarOpacity: 1, //整个导航栏的不透明度
      ),
      // body: Center(
      //     child: RaisedButton(
      //   child: Text('返回'),
      //   onPressed: () {
      //     Navigator.pop(context); //返回到上一个页面
      //   },
      // ))
      body: new ListView(children: <Widget>[
        //题目
        Container(
          width: 375.0, //容器的相关参数
          height: 102.0,
          child: new Text(
            'Surface 九周年之际，微软终于发布了一台“融合怪”',
            maxLines: 2,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ), //容器内的文字，大小，颜色等参数
          alignment: Alignment.centerLeft, //在容器的位置
        ),
        //文章主体文字
        Container(
          width: 375.0, //容器的相关参数
          height: 150.0,
          child: new Text(
            '  银白色的 MacBook一度成为都市白领的标配。然而在2012年，微软推出了 Surface 品牌，对苹果在职场办公设备的统治正式发起了挑战.在这段旅程的初期，Surface 和 Windows 走过弯路，几度令人失望，还好后来成功自救。今天在职场，MacBook 仍然是大部分人的首选，但 Surface 独树一帜，成为很多用户的心头好。',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ), //容器内的文字，大小，颜色等参数
          alignment: Alignment.centerLeft, //在容器的位置
        ),
        Container(
            width: 375.0, //容器的相关参数
            height: 220.0,
            child: new Image.network(
                'https://x0.ifengimg.com/ucms/2021_28/F4273B6EA57CB05FF7E27D69BC7CB443CF86F93A_size61_w800_h533.jpg',
                fit: BoxFit.fill) //容器内的文字，大小，颜色等参数

            ),
        Container(
          width: 375.0, //容器的相关参数
          height: 160.0,
          child: new Text(
            '  现如今，Surface 品牌已经度过9年了。熟悉的 Windows 操作系统，精致的设备外观，顶级的工业设计，以及强大的硬件性能——这些特色从未变过，让秀外慧中的 Surface，在 Windows 电脑的汪洋大海中显得格外独特。特别是 Surface 开创的“二合一”(2-in-1) 融合模式，让设备可以在笔记本电脑和平板之间来回切换，其多功能性备受用户的喜爱。',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ), //容器内的文字，大小，颜色等参数
          alignment: Alignment.centerLeft, //在容器的位置
        ),
        Container(
            width: 375.0, //容器的相关参数
            height: 40.0,
            child: Stack(
              children: [
                new Positioned(
                    top: 5,
                    left: 24,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: new IconButton(
                        icon: const Icon(
                          IconData(
                            0xec7f,
                            fontFamily: 'MyIcons点赞',
                          ),
                          size: 20.0,
                        ),
                        tooltip: '',
                        onPressed: () {
                          print('点了一个赞');
                        },
                      ),
                    )),
                new Positioned(
                    top: 12,
                    left: 55,
                    child: Container(
                        width: 35,
                        height: 20,
                        child: new Text(
                          '点赞',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ))),
                new Positioned(
                    top: 12,
                    left: 201,
                    child: Container(
                        width: 35,
                        height: 20,
                        child: new Text(
                          '评论',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ))),
                new Positioned(
                    top: 12,
                    left: 345,
                    child: Container(
                        width: 35,
                        height: 20,
                        child: new Text(
                          '分享',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ))),
                new Positioned(
                    top: 5,
                    left: 167,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: new IconButton(
                        icon: const Icon(
                          IconData(
                            0xe891,
                            fontFamily: 'MyIcons评论',
                          ),
                          size: 20.0,
                        ),
                        tooltip: '',
                        onPressed: () {
                          print('评论了一下');
                        },
                      ),
                    )),
                new Positioned(
                    top: 5,
                    right: 80,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: new IconButton(
                        icon: const Icon(
                          IconData(
                            0xe600,
                            fontFamily: 'MyIcons分享',
                          ),
                          size: 20.0,
                        ),
                        tooltip: '',
                        onPressed: () {
                          print('分享了一下');
                        },
                      ),
                    ))
              ],
            )),
        Container(
            width: 375.0,
            height: 500.0,
            child: new ListView(children: <Widget>[
              new Container(
                  width: 375.0,
                  height: 140,
                  color: Colors.white,
                  child: Stack(children: [
                    new Positioned(
                        top: 20.0,
                        left: 21.0,
                        child: CircleAvatar(
                          //头像半径
                          radius: 12,
                          //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                          backgroundImage: NetworkImage(
                              'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                        )),
                    new Positioned(
                        top: 25.0,
                        left: 53.0,
                        child: new Text('用户姓名',
                            style: TextStyle(
                              //文本的相关参数
                              fontSize: 10.0,
                            ))),
                    new Positioned(
                        top: 50.0,
                        left: 53.0,
                        child: new Container(
                            height: 70,
                            width: 300,
                            child: Text(
                                '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                )))),
                    new Positioned(
                      top: 100.0,
                      left: 0.0,
                      child: Container(
                          width: 375.0, //容器的相关参数
                          height: 40.0,
                          child: Stack(
                            children: [
                              new Positioned(
                                  top: 5,
                                  left: 24,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xec7f,
                                          fontFamily: 'MyIcons点赞',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('点了一个赞');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 12,
                                  left: 55,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '点赞',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 201,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '评论',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 345,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '分享',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 5,
                                  left: 167,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe891,
                                          fontFamily: 'MyIcons评论',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('评论了一下');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 5,
                                  right: 50,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe600,
                                          fontFamily: 'MyIcons分享',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('分享了一下');
                                      },
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ])),
              new Container(
                  width: 375.0,
                  height: 140,
                  color: Colors.white,
                  child: Stack(children: [
                    new Positioned(
                        top: 20.0,
                        left: 21.0,
                        child: CircleAvatar(
                          //头像半径
                          radius: 12,
                          //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                          backgroundImage: NetworkImage(
                              'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                        )),
                    new Positioned(
                        top: 25.0,
                        left: 53.0,
                        child: new Text('用户姓名',
                            style: TextStyle(
                              //文本的相关参数
                              fontSize: 10.0,
                            ))),
                    new Positioned(
                        top: 50.0,
                        left: 53.0,
                        child: new Container(
                            height: 70,
                            width: 300,
                            child: Text(
                                '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                )))),
                    new Positioned(
                      top: 100.0,
                      left: 0.0,
                      child: Container(
                          width: 375.0, //容器的相关参数
                          height: 40.0,
                          child: Stack(
                            children: [
                              new Positioned(
                                  top: 5,
                                  left: 24,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xec7f,
                                          fontFamily: 'MyIcons点赞',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('点了一个赞');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 12,
                                  left: 55,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '点赞',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 201,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '评论',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 345,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '分享',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 5,
                                  left: 167,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe891,
                                          fontFamily: 'MyIcons评论',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('评论了一下');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 5,
                                  right: 50,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe600,
                                          fontFamily: 'MyIcons分享',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('分享了一下');
                                      },
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ])),
              new Container(
                  width: 375.0,
                  height: 140,
                  color: Colors.white,
                  child: Stack(children: [
                    new Positioned(
                        top: 20.0,
                        left: 21.0,
                        child: CircleAvatar(
                          //头像半径
                          radius: 12,
                          //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                          backgroundImage: NetworkImage(
                              'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                        )),
                    new Positioned(
                        top: 25.0,
                        left: 53.0,
                        child: new Text('用户姓名',
                            style: TextStyle(
                              //文本的相关参数
                              fontSize: 10.0,
                            ))),
                    new Positioned(
                        top: 50.0,
                        left: 53.0,
                        child: new Container(
                            height: 70,
                            width: 300,
                            child: Text(
                                '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                )))),
                    new Positioned(
                      top: 100.0,
                      left: 0.0,
                      child: Container(
                          width: 375.0, //容器的相关参数
                          height: 40.0,
                          child: Stack(
                            children: [
                              new Positioned(
                                  top: 5,
                                  left: 24,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xec7f,
                                          fontFamily: 'MyIcons点赞',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('点了一个赞');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 12,
                                  left: 55,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '点赞',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 201,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '评论',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 345,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '分享',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 5,
                                  left: 167,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe891,
                                          fontFamily: 'MyIcons评论',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('评论了一下');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 5,
                                  right: 50,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe600,
                                          fontFamily: 'MyIcons分享',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('分享了一下');
                                      },
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ])),
              new Container(
                  width: 375.0,
                  height: 140,
                  color: Colors.white,
                  child: Stack(children: [
                    new Positioned(
                        top: 20.0,
                        left: 21.0,
                        child: CircleAvatar(
                          //头像半径
                          radius: 12,
                          //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                          backgroundImage: NetworkImage(
                              'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                        )),
                    new Positioned(
                        top: 25.0,
                        left: 53.0,
                        child: new Text('用户姓名',
                            style: TextStyle(
                              //文本的相关参数
                              fontSize: 10.0,
                            ))),
                    new Positioned(
                        top: 50.0,
                        left: 53.0,
                        child: new Container(
                            height: 70,
                            width: 300,
                            child: Text(
                                '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                )))),
                    new Positioned(
                      top: 100.0,
                      left: 0.0,
                      child: Container(
                          width: 375.0, //容器的相关参数
                          height: 40.0,
                          child: Stack(
                            children: [
                              new Positioned(
                                  top: 5,
                                  left: 24,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xec7f,
                                          fontFamily: 'MyIcons点赞',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('点了一个赞');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 12,
                                  left: 55,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '点赞',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 201,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '评论',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 345,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '分享',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 5,
                                  left: 167,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe891,
                                          fontFamily: 'MyIcons评论',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('评论了一下');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 5,
                                  right: 50,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe600,
                                          fontFamily: 'MyIcons分享',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('分享了一下');
                                      },
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ])),
              new Container(
                  width: 375.0,
                  height: 140,
                  color: Colors.white,
                  child: Stack(children: [
                    new Positioned(
                        top: 20.0,
                        left: 21.0,
                        child: CircleAvatar(
                          //头像半径
                          radius: 12,
                          //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                          backgroundImage: NetworkImage(
                              'https://tse3-mm.cn.bing.net/th/id/OIP-C.2tijjUltXf42Bf2-bTh3GQAAAA?w=192&h=193&c=7&r=0&o=5&dpr=2&pid=1.7'),
                        )),
                    new Positioned(
                        top: 25.0,
                        left: 53.0,
                        child: new Text('用户姓名',
                            style: TextStyle(
                              //文本的相关参数
                              fontSize: 10.0,
                            ))),
                    new Positioned(
                        top: 50.0,
                        left: 53.0,
                        child: new Container(
                            height: 70,
                            width: 300,
                            child: Text(
                                '评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价',
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  //文本的相关参数
                                  fontSize: 10.0,
                                )))),
                    new Positioned(
                      top: 100.0,
                      left: 0.0,
                      child: Container(
                          width: 375.0, //容器的相关参数
                          height: 40.0,
                          child: Stack(
                            children: [
                              new Positioned(
                                  top: 5,
                                  left: 24,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xec7f,
                                          fontFamily: 'MyIcons点赞',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('点了一个赞');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 12,
                                  left: 55,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '点赞',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 201,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '评论',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 12,
                                  left: 345,
                                  child: Container(
                                      width: 35,
                                      height: 20,
                                      child: new Text(
                                        '分享',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))),
                              new Positioned(
                                  top: 5,
                                  left: 167,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe891,
                                          fontFamily: 'MyIcons评论',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('评论了一下');
                                      },
                                    ),
                                  )),
                              new Positioned(
                                  top: 5,
                                  right: 50,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: new IconButton(
                                      icon: const Icon(
                                        IconData(
                                          0xe600,
                                          fontFamily: 'MyIcons分享',
                                        ),
                                        size: 10.0,
                                      ),
                                      tooltip: '',
                                      onPressed: () {
                                        print('分享了一下');
                                      },
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ])),
            ]) //容器内的文字，大小，颜色等参数

            ),

        //点赞评论
      ]),
    );
  }
}
