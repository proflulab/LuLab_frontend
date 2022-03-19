import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proflu/common/utils/utils.dart';
import 'users_The home page_user.dart';

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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Dty()));
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
    return Container(
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
              child: Opacity(
                //透明控件
                opacity: 0.15,
                child: Image.asset(
                  'assets/images/OIP-TY.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: ListView(
                children: const [
                  Text(
                    '陆向谦实验室APP-给您更高效的交互体验，装机必备。打开就是语音交互栏，方便在各种场景和时刻对话。更有新闻资讯、视频课程，众多精彩内容，总有一项适合你。【语音交互更高效】强大的语音交互栏，语音对话触达全站，领先的智能语音可以快速识别你的需求，帮你找到想要的内容。语音识别的准确率达97%以上。【界面简洁更便捷】化繁为简，全新升级，界面更简洁。直播授课，精彩访谈、热点资讯，你想要的都能一目了然。【精选内容更懂你】精选新闻、资讯等优质内容，智能算法推荐给你更关心的、更喜欢的内容。【大咖课程全新上线】明星大咖创业导师课程全新上线，让你和大咖近一点儿、再近一点儿。陆向谦实验室APP-给您更高效的交互体验，装机必备。打开就是语音交互栏，方便在各种场景和时刻对话。更有新闻资讯、视频课程，众多精彩内容，总有一项适合你。【语音交互更高效】强大的语音交互栏，语音对话触达全站，领先的智能语音可以快速识别你的需求，帮你找到想要的内容。语音识别的准确率达97%以上。【界面简洁更便捷】化繁为简，全新升级，界面更简洁。直播授课，精彩访谈、热点资讯，你想要的都能一目了然。【精选内容更懂你】精选新闻、资讯等优质内容，智能算法推荐给你更关心的、更喜欢的内容。【大咖课程全新上线】明星大咖创业导师课程全新上线，让你和大咖近一点儿、再近一点儿。陆向谦实验室APP-给您更高效的交互体验，装机必备。打开就是语音交互栏，方便在各种场景和时刻对话。更有新闻资讯、视频课程，众多精彩内容，总有一项适合你。【语音交互更高效】强大的语音交互栏，语音对话触达全站，领先的智能语音可以快速识别你的需求，帮你找到想要的内容。语音识别的准确率达97%以上。【界面简洁更便捷】化繁为简，全新升级，界面更简洁。直播授课，精彩访谈、热点资讯，你想要的都能一目了然。【精选内容更懂你】精选新闻、资讯等优质内容，智能算法推荐给你更关心的、更喜欢的内容。【大咖课程全新上线】明星大咖创业导师课程全新上线，让你和大咖近一点儿、再近一点儿。陆向谦实验室APP-给您更高效的交互体验，装机必备。打开就是语音交互栏，方便在各种场景和时刻对话。更有新闻资讯、视频课程，众多精彩内容，总有一项适合你。【语音交互更高效】强大的语音交互栏，语音对话触达全站，领先的智能语音可以快速识别你的需求，帮你找到想要的内容。语音识别的准确率达97%以上。【界面简洁更便捷】化繁为简，全新升级，界面更简洁。直播授课，精彩访谈、热点资讯，你想要的都能一目了然。【精选内容更懂你】精选新闻、资讯等优质内容，智能算法推荐给你更关心的、更喜欢的内容。【大咖课程全新上线】明星大咖创业导师课程全新上线，让你和大咖近一点儿、再近一点儿。陆向谦实验室APP-给您更高效的交互体验，装机必备。打开就是语音交互栏，方便在各种场景和时刻对话。更有新闻资讯、视频课程，众多精彩内容，总有一项适合你。【语音交互更高效】强大的语音交互栏，语音对话触达全站，领先的智能语音可以快速识别你的需求，帮你找到想要的内容。语音识别的准确率达97%以上。【界面简洁更便捷】化繁为简，全新升级，界面更简洁。直播授课，精彩访谈、热点资讯，你想要的都能一目了然。【精选内容更懂你】精选新闻、资讯等优质内容，智能算法推荐给你更关心的、更喜欢的内容。【大咖课程全新上线】明星大咖创业导师课程全新上线，让你和大咖近一点儿、再近一点儿。',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
