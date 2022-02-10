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
          title: Text(infordata.title, style: TextStyle(fontSize: 22.0)),
        ),
        body: Column(
          children: <Widget>[
            Container(
                height: 650,
                width: 375,
                child: SingleChildScrollView(
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      Text(infordata.title, style: TextStyle(fontSize: 22.0)),
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
                      Container(
                        width: 375,
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Text(infordata.content),
                      ),
                    ],
                  )),
                )),
            Container(
              height: 53,
              width: 375,
              child: ElevatedButton(
                child: Text("点击"),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            height: 500,
                            width: 375,
                            child: new TextField(
                              keyboardType: TextInputType.multiline,

                              maxLines: 30,
                              //maxLines:null 不限制行数
                            ));
                      });
                },
              ),
            )
          ],
        ));
  }
}
