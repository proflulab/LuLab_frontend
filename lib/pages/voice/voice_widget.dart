import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:lottie/lottie.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/values/values.dart';

class VoiceWidget extends StatefulWidget {
  /// 1-Ai speaking 2-识别出错 3-提示 4-用户语音实时翻译
  final int type;

  const VoiceWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget> {
  List<String> hints = ["“我要预订直播课”", "“听今日新闻”", "“陆向谦实验室”"];

  final String _text = "你好我想问一下陆向谦实验室是什么,还有我想问下陆向谦教授是哪位呢?";

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 1:
        return _aiSpeakingWidget();
      case 2:
        return _errorWidget();
      case 3:
        return _swiperWidget();
      case 4:
        return _userSpeakingWidget();
      default:
        return Container();
    }
  }

  Widget _userSpeakingWidget() {
    return _container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Lottie.asset(
            'assets/animation/wave.json',
            width: 420.w,
            height: 74.w,
          )
        ],
      ),
      height: 350.w,
    );
  }

  Widget _swiperWidget() {
    return _withLogoWidget(
      child: Swiper(
        itemBuilder: (c, i) {
          return Center(
            child: Text(
              hints[i],
              style: const TextStyle(fontSize: 14),
            ),
          );
        },
        itemCount: hints.length,
        autoplay: true,
        scrollDirection: Axis.vertical,
      ),
      width: 506.w,
      height: 350.w,
    );
  }

  Widget _aiSpeakingWidget() {
    return _withLogoWidget(
      child: Lottie.asset(
        'assets/animation/ai_speaking.json',
        width: 134.w,
        height: 64.w,
      ),
      width: 350.w,
      height: 280.w,
    );
  }

  Widget _errorWidget() {
    return _withLogoWidget(
      child: Text(
        "未能识别,请点击语音按钮重试",
        style: TextStyle(
          fontSize: 32.w,
          color: PFc.textSecondary,
        ),
      ),
      width: 506.w,
      height: 280.w,
    );
  }

  Widget _withLogoWidget(
      {required Widget child, required double width, double? height}) {
    return _container(
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 144.w,
              height: 144.w,
            ),
            SizedBox(width: 10.w),
            Container(
              width: width,
              height: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xffEEEEEE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.w),
                  topRight: Radius.circular(30.w),
                  bottomRight: Radius.circular(30.w),
                ),
              ),
              alignment: Alignment.center,
              child: child,
            )
          ],
        ),
        height: height);
  }

  Widget _container(
      {required Widget child, double? height, bool imageBg = true}) {
    DecorationImage? decorationImage;
    if (imageBg) {
      decorationImage = const DecorationImage(
          image: AssetImage("assets/images/voice_bg.png"), fit: BoxFit.cover);
    }
    return Container(
      height: height ?? 350.w,
      width: 750.w,
      decoration: BoxDecoration(
        color: Colors.white,
        image: decorationImage,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: child,
    );
  }
}
