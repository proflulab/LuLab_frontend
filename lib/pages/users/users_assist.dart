import 'package:flutter/material.dart';

class AdviceOnlinePage extends StatefulWidget {
  const AdviceOnlinePage({Key? key}) : super(key: key);

  @override
  _AdviceOnlinePageState createState() => _AdviceOnlinePageState();
}

class _AdviceOnlinePageState extends State<AdviceOnlinePage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    //double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '在线咨询',
          style: TextStyle(color: Colors.black),
        ),
        //appbar左侧返回按钮
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}
