import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  // 定义构造函数参数，必选url视频播放链接，可选cover封面链接，autoPlay是否自动播放，looping循环播放，aspectRatio视频比例
  final String url;
  //final String cover;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;

  const VideoView(this.url,
      {Key? key,
      //required this.cover,
      this.autoPlay = true,
      this.looping = true,
      this.aspectRatio = 16 / 9})
      : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController
      _videoPlayerController; // video_player 播放器controller
  late ChewieController _chewieController; // chewie播放器controller

  String a = "1";

  @override
  void initState() {
    super.initState();

    // 初始化播放器
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      aspectRatio: widget.aspectRatio,
      // 是否在 UI 构建的时候就加载视频
      autoInitialize: true,
      //拖动条样式颜色
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.lightGreen,
        handleColor: Colors.green,
        backgroundColor: const Color.fromARGB(103, 158, 158, 158),
        bufferedColor: const Color.fromARGB(255, 158, 158, 158),
      ),
      //视频封面
      // placeholder: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: NetworkImage(widget.cover),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 结束后释放controller
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double playerHeight = screenWidth / widget.aspectRatio;
    return Container(
      width: screenWidth,
      height: playerHeight,
      color: Colors.black,
      child: Chewie(controller: _chewieController),
    );
  }
}

// 构造属性	                          说明
// videoPlayerController	     视频的控制器
// autoInitialize	             在启动时初始化视频。 这将准备播放视频。
// startAt	                     在特定位置开始播放视频
// autoPlay	             显示视频后立即播放
// looping	                     视频是否应循环播放
// showControlsOnInitialize     初始化小部件时是否显示控件。
// showControls	             是否完全显示控件
// customControls	             定义自定义控件
// errorBuilder	             当视频播放出现错误时，您可以构建自定义
// aspectRatio	             视频的宽高比。 重要的是要获得正确的尺寸，将回退到适合的空间内。
// cupertinoProgressColors	     用于iOS控件的颜色。 默认情况下，iOS播放器使用，从原始iOS 11设计中采样的颜色。
// materialProgressColors	     物料进度条要使用的颜色。 默认情况下，材质 播放器使用主题中的颜色。
// placeholder	             初始化之前，占位符显示在视频下方
// overlay	                     在视频和控件之间放置的小部件
// fullScreenByDefault	     定义按下播放器时播放器是否以全屏启动
// allowedScreenSleep	     定义播放器是否全屏睡眠
// allowFullScreen	             定义是否应显示全屏控件
// isLive	                     定义控件是否应用于实时流视频
// allowMuting	             定义是否应显示静音控件
// systemOverlaysAfterFullScreen	        定义退出全屏后可见的系统覆盖
// deviceOrientationsAfterFullScreen	退出全屏后定义一组允许的设备方向
// routePageBuilder	                为全屏定义自定义RoutePageBuilder


// //在特定位置开始播放视频,这里为第60秒开始播放
// startAt:Duration( 
//         seconds:60,
//  ),


