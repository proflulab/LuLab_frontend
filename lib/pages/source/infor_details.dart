import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            '详情',
            style: TextStyle(
              fontFamily: 'MyFontStyle',
              color: Colors.green,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
                height: 1082.h,
                width: 800.w,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      Text(
                        infordata.title,
                        style: const TextStyle(
                          fontFamily: 'MyFontStyle',
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      // ElevatedButton(
                      //   child: Text("播放"),
                      //   onPressed: () {
                      //     sstSpeak(text: infordata.content);
                      //   },
                      // ),
                      // ElevatedButton(
                      //   child: Text("暂停"),
                      //   onPressed: () {
                      //     tts.stop();
                      //   },
                      // ),
                      Container(
                        width: 375,
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Text(
                          infordata.content,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )),
                )),
            // Container(
            //   height: 53,
            //   width: 375,
            //   child: ElevatedButton(
            //     child: Text("点击"),
            //     onPressed: () {
            //       showModalBottomSheet(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return Container(
            //                 height: 500,
            //                 width: 375,
            //                 child: new TextField(
            //                   keyboardType: TextInputType.multiline,
            //
            //                   maxLines: 30,
            //                   //maxLines:null 不限制行数
            //                 ));
            //           });
            //     },
            //   ),
            // )
          ],
        ));
  }
}
