import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

class VideoScreen extends StatefulWidget {
  final String url;
  final String cover;
  const VideoScreen({Key? key, required this.url, required this.cover})
      : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.url, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      alignment: Alignment.center,
      child: FijkView(
        player: player,
        color: Colors.black,
        fit: FijkFit.ar16_9,
        cover: NetworkImage(widget.cover),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
