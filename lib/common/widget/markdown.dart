//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
//import '../../common/utils/utils.dart';
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
      styleSheet: MarkdownStyleSheet(
        p: const TextStyle(fontSize: 18, height: 1.8),
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
