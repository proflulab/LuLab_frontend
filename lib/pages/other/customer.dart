import 'package:flutter/material.dart';

class Customer extends StatefulWidget {
  Customer({Key? key}) : super(key: key);

  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我是客服区"),
      ),
      body: Text("我是客服区"),
    );
  }
}
