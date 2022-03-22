import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proflu/common/utils/utils.dart';
import '../../sign_in/sign_in.dart';

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignInPage()));
          },
          // padding: EdgeInsets.all(10),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          '产品特色',
          style: TextStyle(fontFamily: 'MyFontStyle', color: Colors.black),
        ),
      ),
      body: const APP(),
    );
  }
}

class APP extends StatelessWidget {
  const APP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/OIP-YYH.jpg',
          fit: BoxFit.fill,
          width: 365,
          height: 200,
        ),
        Center(
          child: Container(
              width: 400,
              height: 400,
              margin: const EdgeInsets.only(right: 10, left: 15),
              //内间距
              child: Stack(
                //重叠的Stack Widget，实现重叠
                children: <Widget>[
                  Center(
                    child: BackdropFilter(
                      //背景滤镜器
                      filter: ImageFilter.blur(
                        sigmaX: 0.5,
                      ), //图片模糊过滤，横向竖向都设置5.0
                      child: const Opacity(
                        //透明控件
                        opacity: 0.15,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: ListView(
                        children: const [
                          ListTile(
                            title: Text(
                              '陆向谦实验室APP。',
                            ),
                            subtitle: Text(
                              "给您更高效的交互体验，装机必备",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                          ListTile(
                            title: Text(
                                '打开就是语音交互栏，方便在各种场景和时刻对话。更有新闻资讯、视频课程，众多精彩内容，总有一项适合你。'),
                          ),
                          ListTile(
                            title: Text(
                              '【语音交互更高效】',
                            ),
                            subtitle: Text(
                              "强大的语音交互栏，语音对话触达全站，领先的智能语音可以快速识别你的需求，帮你找到想要的内容。语音识别的准确率达97%以上。",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              '【界面简洁更便捷】',
                            ),
                            subtitle: Text(
                              "化繁为简，全新升级，界面更简洁。直播授课，精彩访谈、热点资讯，你想要的都能一目了然。",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              '【精选内容更懂你】',
                            ),
                            subtitle: Text(
                              "精选新闻、资讯等优质内容，智能算法推荐给你更关心的、更喜欢的内容。",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              '【大咖课程全新上线】',
                            ),
                            subtitle: Text(
                              "明星大咖创业导师课程全新上线，让你和大咖近一点儿、再近一点儿。",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
              )),
        )
      ],
    );
  }
}
