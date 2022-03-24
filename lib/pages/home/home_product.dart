import 'package:flutter/material.dart';

import '../../common/entitys/entitys.dart';
import '../../common/json/jsondata.dart';
import '../../common/utils/utils.dart';
import 'home_product_detail.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late Train _postsDataProduct;

  //final _product = Train.fromJson(json.decode(Jsondata.product));

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
              alignment: Alignment.topLeft,
              width: 1.sw,
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                      width: 1.sw,
                      height: 250,
                      child: Column(
                        children: [
                          Text(
                            _postsDataProduct.data.product[index].name,
                          ),
                          const SizedBox(height: 10),
                          Container(
                              color: Colors.blue,
                              width: 340,
                              height: 100,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.red,
                                        height: 100,
                                        child: Text(
                                          _postsDataProduct
                                              .data.product[index].description,
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 100,
                                        child: Image.network(
                                            _postsDataProduct
                                                .data.product[index].img,
                                            fit: BoxFit.cover),
                                      ))
                                ],
                              )
                              // Image.network(
                              //   'https://img2.baidu.com/it/u=295131672,1212858880&fm=253&fmt=auto&app=138&f=JPEG?w=325&h=200',
                              //   fit: BoxFit.fill,
                              //   width: 400,
                              // ),
                              ),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    child: const Text('特点1'),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                        height: 50,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          child: const Text(' 特点2'),
                                        ))),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                        height: 50,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          child: const Text(' 特点2'),
                                        ))),
                              ],
                            ),
                          )
                        ],
                      )
                      //Image.network(
                      //   _postsDataProduct.data.product[index].img,
                      //   fit: BoxFit.contain,
                      //   height: 100,
                      //   width: 100,
                      // ),
                      ),
                ],
              )),
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
