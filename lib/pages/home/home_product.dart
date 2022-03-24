import 'package:flutter/material.dart';

import '../../common/entitys/entitys.dart';
import '../../common/staticdata/jsondata.dart';
import '../../common/utils/utils.dart';
import 'home_product_detail.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late Train _postsDataProduct;

  @override
  void initState() {
    super.initState();
    _postsDataProduct = Train.fromJson(Jsondata.product);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _postsDataProduct.data.product.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            width: 1.sw,
            height: 300,
            color: const Color.fromARGB(255, 226, 195, 192),
            child: Text(
              _postsDataProduct.data.product[index].description,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  product: _postsDataProduct.data.product[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
