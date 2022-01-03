import 'package:flutter/material.dart';

class InforDetails extends StatefulWidget {
  const InforDetails({Key? key, required this.product}) : super(key: key);
  final product;

  @override
  _InforDetailsState createState() => _InforDetailsState();
}

class _InforDetailsState extends State<InforDetails> {
  late final infordata = widget.product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("资讯内容"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              Text(infordata.content),
            ],
          )),
        ));
  }
}
