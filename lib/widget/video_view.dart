import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  // 定义构造函数参数，必选url视频播放链接，可选cover封面链接，autoPlay是否自动播放，looping循环播放，aspectRatio视频比例
  final String url;
  final String cover;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;

  const VideoView(this.url,
      {Key? key,
      this.cover = '',
      this.autoPlay = false,
      this.looping = false,
      this.aspectRatio = 16 / 9});

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController
      _videoPlayerController; // video_player 播放器controller
  late ChewieController _chewieController; // chewie播放器controller

  @override
  void initState() {
    super.initState();
    // 初始化播放器
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        aspectRatio: widget.aspectRatio);
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
      color: Colors.black12,
      child: Chewie(controller: _chewieController),
    );
  }
}
