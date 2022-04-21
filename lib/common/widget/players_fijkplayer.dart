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
    // double screenWidth = MediaQuery.of(context).size.width;
    // double playerHeight = screenWidth / 1.5;
    return Container(
      // width: screenWidth,
      // height: playerHeight,
      //color: Colors.black,
      height: 235,
      alignment: Alignment.center,
      child: FijkView(
        player: player,
        //panelBuilder: fijkPanel2Builder(fill: true),
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
