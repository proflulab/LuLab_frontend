import 'package:flutter/material.dart';

class Train extends StatefulWidget {
  Train({Key? key}) : super(key: key);

  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("技术训练营，创新训练营，其他。。。。。。"),
    );
  }
}
