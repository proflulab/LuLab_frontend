import 'package:get/get.dart';
import 'package:proflu/common/global/global.dart';

import '../common/entitys/data_user_login.dart';
import '../common/utils/storage.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  Data? user;

  loginSuccess(Data u) {
    user = u;
    Storage.setInt('isFirstSign', Global.isFirstSign);
    Global.saveProfile(u);
    update();
  }

  logout() {
    user = null;
    Global.removeProfile();
  }
}
