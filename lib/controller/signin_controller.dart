import 'package:get/get.dart';

class SigninController extends GetxController {
  var code = 86.obs;
  increment(int e) {
    code.value = e;
  }
}
