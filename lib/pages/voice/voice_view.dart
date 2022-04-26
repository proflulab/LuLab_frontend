import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proflu/controller/index_controller.dart';

class VoiceView extends StatefulWidget {
  const VoiceView({Key? key}) : super(key: key);

  @override
  _VoiceViewState createState() => _VoiceViewState();
}

class _VoiceViewState extends State<VoiceView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      margin: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onLongPressStart: (c) {
          IndexController.to.startSpeaking();
        },
        onLongPressEnd: (c) {
          IndexController.to.stopSpeaking();
        },
        child: GetBuilder<IndexController>(builder: (ic) {
          return Container(
            alignment: Alignment.center,
            child: ClipOval(
              child: Lottie.asset(
                  "assets/animation/${ic.speaking ? 'speaking2' : 'speaking'}.json"),
            ),
          );
        }),
      ),
    );
  }
}
