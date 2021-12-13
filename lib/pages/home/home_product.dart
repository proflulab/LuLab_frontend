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
      child: Text("我是训练营"),
    );
  }
}
