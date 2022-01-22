import 'package:flutter/material.dart';
import 'package:proflu/common/utils/text_to_speech.dart';
import 'package:text_to_speech/text_to_speech.dart';

class InforDetails extends StatefulWidget {
  const InforDetails({Key? key, required this.product}) : super(key: key);
  final product;

  @override
  _InforDetailsState createState() => _InforDetailsState();
}

class _InforDetailsState extends State<InforDetails> {
  late final infordata = widget.product;
  TextToSpeech tts = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(infordata.title),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text("播放"),
                onPressed: () {
                  sstSpeak(text: infordata.content);
                },
              ),
              ElevatedButton(
                child: Text("暂停"),
                onPressed: () {
                  tts.stop();
                },
              ),
              Text(infordata.content),
            ],
          )),
        ));
  }
}
