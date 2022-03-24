import 'package:flutter/foundation.dart';

//字体规格,参考以下网站
//https://www.shejidaren.com/examples/tools/golden-ratio/index.html
class PFr {
  static const double ratio16_9 = 16 / 9;
  static const double ratio16_10 = 16 / 10;
  static const double ratio1_1 = 1;
  static const double ratio2_3 = 2 / 3;
  static const double ratio3_4 = 3 / 4;
  static const double ratio9_16 = 9 / 16;
  //白银比例（Silver Ratio）
  static const double silver = 0.707;
  //黄金比（Golden Ratio）
  static const double golden = 0.618;
  //铂金比例（Platinum Ratio）
  static const double platinum = 0.577;
  static const double silver414 = 0.414;
  static const double ratio1_2 = 1 / 2;
  //青铜比例（Bronze Ratio）
  static const double bronze = 0.303;
}

//e输入参数，t比例值，n循环次数
double cycle(double e, double t, int n) {
  double a = e;
  for (var i = 0; i < n; i++) {
    a = a * t;
    if (kDebugMode) {
      print("等比例$t递归${i + 1}次结果$a");
    }
    if (a < 0.0001) {
      if (kDebugMode) {
        print("达到精度极限");
      }
      return double.parse(a.toStringAsFixed(3));
    }
  }
  return double.parse(a.toStringAsFixed(3));
}
