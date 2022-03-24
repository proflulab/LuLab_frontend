import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

class PFMarkdown extends StatefulWidget {
  const PFMarkdown({Key? key, required this.data}) : super(key: key);
  final String data;
  @override
  State<PFMarkdown> createState() => _PFMarkdownState();
}

class _PFMarkdownState extends State<PFMarkdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Markdown(
        //controller: controller,
        selectable: true,
        data: widget.data,
      ),
    );
  }
}
