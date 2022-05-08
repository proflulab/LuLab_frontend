import 'package:flutter/foundation.dart';

class PFcontrast {
  static client(String input, String value) {
    List<String> a1 = input.split("");

    List<int> e1 = [];

    if (a1.isEmpty) {
      e1.add(-1);
    }

    if (kDebugMode) {
      print(a1);
    }

    for (int i = 0; i < a1.length; i++) {
      e1.add(value.indexOf(input[i]));
    }

    if (kDebugMode) {
      print(e1);
    }

    if (e1.contains(-1)) {
      if (kDebugMode) {
        print("false");
      }
      return false;
    } else {
      if (kDebugMode) {
        print("true");
      }
      return true;
    }
  }
}
