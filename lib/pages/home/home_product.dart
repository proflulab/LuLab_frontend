import 'package:flutter/material.dart';

import '../../common/widget/find_bottom_tool.dart';
import '../../common/widget/find_config.dart';

class AppDemo extends StatefulWidget {
  const AppDemo({Key? key}) : super(key: key);

  @override
  State<AppDemo> createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {
  @override
  Widget build(BuildContext context) {
    return FindBottomTool(
      actionCallback: (FindActionType type) {},
      controller: TextEditingController(text: "shiming"),
      focusNode: FocusNode(skipTraversal: true),
      submitAction: (String text) {},
    );
  }
}
