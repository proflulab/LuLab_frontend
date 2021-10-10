import 'package:flutter/material.dart';

class Optimization extends StatefulWidget {
  @override
  _OptimizationState createState() => _OptimizationState();
}

class _OptimizationState extends State<Optimization> {
  bool _enabled = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 60,
        decoration: BoxDecoration(
          color: _enabled ? Colors.black12 : Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Center(
          child: Text(
            '意见反馈',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTapDown: (TapDownDetails details) {
        setState(() {
          _enabled = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _enabled = false;
        });
      },
    );
  }
}
