//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import '../../common/widget/widgets.dart';

class PFMarkdown extends StatefulWidget {
  const PFMarkdown({Key? key, required this.data}) : super(key: key);
  final String data;
  @override
  State<PFMarkdown> createState() => _PFMarkdownState();
}

class _PFMarkdownState extends State<PFMarkdown> {
  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      //controller: controller,
      selectable: true,
      data: widget.data,
      //https://www.itbaoku.cn/post/1596844/do
      //改变文字大小
      // styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      //   p: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18.0),
      // ),
      styleSheet: MarkdownStyleSheet(
        // 支持修改样式
        //a: const TextStyle(fontSize: 150),
        p: const TextStyle(
          fontSize: 15,
          height: 1.5,
        ),
        pPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        h1: const TextStyle(fontSize: 14),
      ),
      //syntaxHighlighter: HighLight(),
      onTapLink: (text, href, title) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Browser(
              url: href!,
              title: title,
            ),
          ),
        );
      },
    );
  }
}
