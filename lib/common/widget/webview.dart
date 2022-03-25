import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/widget/widgets.dart';

class Browser extends StatelessWidget {
  const Browser({Key? key, required this.url, required this.title})
      : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(context: context, title: title),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
