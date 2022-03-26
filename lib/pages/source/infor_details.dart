import 'package:flutter/material.dart';

import 'package:text_to_speech/text_to_speech.dart';

//import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
//import '../../common/staticdata/makdowndata.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

class InforDetails extends StatefulWidget {
  const InforDetails({Key? key, required this.product}) : super(key: key);
  final LatestInformation product;

  @override
  _InforDetailsState createState() => _InforDetailsState();
}

class _InforDetailsState extends State<InforDetails> {
  late final infordata = widget.product;
  TextToSpeech tts = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(
              PFspace.screenMargin, 0, PFspace.screenMargin, 0),
          //color: Colors.red,
          child: Column(
            children: [
              Flexible(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((content, index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
                                height: 100.h,
                                width: 1.sw,
                                child: Text(
                                  infordata.title,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: PFc.textPrimary,
                                    fontFamily: 'MyFontStyle',
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                                height: 100.h,
                                width: 1.sw,
                                child: Text(
                                  infordata.releaseDate,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: PFc.textPrimary,
                                    fontFamily: '',
                                    fontSize: 23,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (index == 1) {
                          return PFMarkdown(data: infordata.mdtext);
                        } else if (index == 2) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 100.h,
                                child: const Text(
                                  "评价部分——未开发",
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: 'MyFontStyle',
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return null;
                      }, childCount: 3),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                height: 100,
                child: const Text("data"),
              ),
            ],
          ),
        )

        // Container(
        //   height: 1082.h,
        //   width: 800.w,
        //   color: Colors.white,
        //   child: SingleChildScrollView(
        //     child: Center(
        //       child: Column(
        //         children: <Widget>[
        //           Text(
        //             infordata.title,
        //             style: const TextStyle(
        //               fontFamily: 'MyFontStyle',
        //               color: Colors.black,
        //               fontSize: 22,
        //             ),
        //           ),
        //           // ElevatedButton(
        //           //   child: Text("播放"),
        //           //   onPressed: () {
        //           //     sstSpeak(text: infordata.content);
        //           //   },
        //           // ),
        //           // ElevatedButton(
        //           //   child: Text("暂停"),
        //           //   onPressed: () {
        //           //     tts.stop();
        //           //   },
        //           // ),
        //           Container(
        //             width: 375,
        //             padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        //             child: Text(
        //               infordata.content,
        //               style: const TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 20,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
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
        //   ],
        // ),
        );
  }
}
