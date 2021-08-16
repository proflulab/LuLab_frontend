import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'lulab app';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(vertical: 20.0),
          height: 50.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new Container(
                width: 160.0,
                child: Text('   推荐区'),
                //color: Colors.red,
              ),
              new Container(
                width: 160.0,
                child: Text('功勋员'),
                //color: Colors.blue,
              ),
              new Container(
                width: 160.0,
                child: Text('训练营'),
                //color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
