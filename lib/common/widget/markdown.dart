//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
//import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';

class PFMarkdown extends StatefulWidget {
  final String data;
  final TextStyle? p;
  final EdgeInsets? pPadding;
  final TextStyle? h1;
  const PFMarkdown({
    Key? key,
    required this.data,
    this.p,
    this.pPadding,
    this.h1,
  }) : super(key: key);

  @override
  State<PFMarkdown> createState() => _PFMarkdownState();
}

class _PFMarkdownState extends State<PFMarkdown> {
  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      selectable: true,
      data: widget.data,
      styleSheet: MarkdownStyleSheet(
        p: widget.p,
        pPadding: widget.pPadding,
        h1: widget.h1,
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
