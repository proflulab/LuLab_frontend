import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
        navigationDelegate: (NavigationRequest request) {
          if (kDebugMode) {
            print(request.url);
          }
          if (!request.url.startsWith("http") ||
              !request.url.startsWith("https:")) {
            launch(request.url);
            Navigator.of(context).pop();
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}

//参考资料
//https://www.jianshu.com/p/9fbe96acf47f
//https://juejin.cn/post/6844904197599526925