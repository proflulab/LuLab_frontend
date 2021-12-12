import 'package:flutter/material.dart';

class SetAccount extends StatefulWidget {
  SetAccount({Key? key}) : super(key: key);
  @override
  _SetAccountState createState() => _SetAccountState();
}

class _SetAccountState extends State<SetAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '账号设置',
          ),
        ),
        body: Column());
  }
}
