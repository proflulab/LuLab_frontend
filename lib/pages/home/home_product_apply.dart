import 'package:flutter/material.dart';

import '../../common/widget/webview.dart';

class ProductApply extends StatefulWidget {
  const ProductApply({Key? key, required this.product}) : super(key: key);
  final String product;
  @override
  State<ProductApply> createState() => _ProductApplyState();
}

class _ProductApplyState extends State<ProductApply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Browser(url: widget.product),
    );
  }
}
