import 'package:flutter/material.dart';

import '../../common/values/values.dart';
import '../../common/entitys/entitys.dart';
import '../../common/widget/webview.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Browser(
              url: widget.product.detailurl,
              title: widget.product.name,
            ),
          ),
          GestureDetector(
            child: Container(
              color: PFc.themeColor10,
              height: PFspace.screenH * 0.15,
              child: const Center(
                child: Text("点击申请"),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Browser(
                    url: widget.product.applyurl,
                    title: "填写申请",
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
