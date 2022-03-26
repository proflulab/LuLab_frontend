import 'package:flutter/material.dart';
import '../../common/widget/widgets.dart';

/// 封装一个连续按两次返回键退出页面的组件
/// child 子组件
/// delay 两次返回间隔时间
class UseWillPopScope extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const UseWillPopScope(
      {Key? key, this.delay = const Duration(seconds: 1), required this.child})
      : super(key: key);

  @override
  _UseWillPopScopeState createState() => _UseWillPopScopeState();
}

class _UseWillPopScopeState extends State<UseWillPopScope> {
  DateTime? _lastWillPopAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: () async {
        if (_lastWillPopAt == null ||
            _lastWillPopAt != null &&
                DateTime.now().difference(_lastWillPopAt!) > widget.delay) {
          _lastWillPopAt = DateTime.now();
          toastInfo(msg: "再按一次退出陆向谦实验室");
          return false;
        }
        return true;
      },
    );
  }
}
