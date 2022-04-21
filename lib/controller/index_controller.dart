import 'package:get/get.dart';

class IndexController extends GetxController {
  static IndexController get to => Get.find();

  bool speaking = false;

  void startSpeaking() {
    speaking = true;
    update();
  }

  void stopSpeaking() {
    speaking = false;
    update();
  }
}
