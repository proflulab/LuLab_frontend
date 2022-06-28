import 'package:flutter/widgets.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class PFVibrate {
  static vibrate() async {
    bool canVibrate = await Vibrate.canVibrate;
    debugPrint(canVibrate ? "此设备支持震动" : "此设备不支持支持震动");
    if (canVibrate) {
      // Vibrate
      // Vibration duration is a constant 500ms because
      // it cannot be set to a specific duration on iOS.
      Vibrate.vibrate();
    }
  }

  static vibrateWithPauses() async {
    final Iterable<Duration> pauses = [
      const Duration(milliseconds: 500),
      const Duration(milliseconds: 500),
      const Duration(milliseconds: 500),
      const Duration(milliseconds: 500),
    ];
    bool canVibrate = await Vibrate.canVibrate;
    debugPrint(canVibrate ? "此设备支持震动" : "此设备不支持支持震动");
    if (canVibrate) {
      Vibrate.vibrateWithPauses(pauses);
    }
  }

  static feedback(type) async {
    bool canVibrate = await Vibrate.canVibrate;
    debugPrint(canVibrate ? "此设备支持震动" : "此设备不支持支持震动");
    if (canVibrate) {
      switch (type) {
        case Type.impact:
          Vibrate.feedback(FeedbackType.impact);
          break;
        case Type.error:
          Vibrate.feedback(FeedbackType.error);
          break;
        case Type.success:
          Vibrate.feedback(FeedbackType.success);
          break;
        case Type.warning:
          Vibrate.feedback(FeedbackType.warning);
          break;
        case Type.selection:
          Vibrate.feedback(FeedbackType.selection);
          break;
        case Type.heavy:
          Vibrate.feedback(FeedbackType.heavy);
          break;
        case Type.medium:
          Vibrate.feedback(FeedbackType.medium);
          break;
        case Type.light:
          Vibrate.feedback(FeedbackType.light);
          break;
        default:
          Vibrate.feedback(FeedbackType.success);
      }
    }
  }
}

// Choose from any of these available methods
enum Type { success, error, warning, selection, impact, heavy, medium, light }
