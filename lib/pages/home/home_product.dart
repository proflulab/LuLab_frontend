import 'package:flutter/material.dart';
import '../../common/utils/utils.dart';
import 'home_product_detail.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);
  final List product = ["创新训练营", "技术训练营", "亲子项目"];
  final List url = [
    "https://blog.csdn.net/LJLThomson/article/details/116272981",
    "https://www.jianshu.com/p/96a9a38413a5",
    "https://www.jianshu.com/p/96a9a38413a5"
  ];

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.product.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            width: 1.sw,
            height: 300,
            color: const Color.fromARGB(255, 226, 195, 192),
            child: Text(widget.product[index]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  product: widget.url[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
