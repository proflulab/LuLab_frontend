import 'package:wakelock/wakelock.dart';

class PFwakelock {
  static passState(int stata) {
    bool enable = false;
    if (stata == 1) {
      enable = true;
    }
    Wakelock.toggle(enable: enable);
  }

  static getState() async {
    bool wakelockEnabled = await Wakelock.enabled;
    return wakelockEnabled;
  }
}
