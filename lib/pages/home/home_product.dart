import 'package:flutter/material.dart';

import '../other/loading.dart';

class AppDemo extends StatefulWidget {
  const AppDemo({Key? key}) : super(key: key);

  @override
  State<AppDemo> createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {
  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}
