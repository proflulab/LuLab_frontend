import 'package:flutter/material.dart';

import '../../common/entitys/entitys.dart';
import '../../common/staticdata/json_data.dart';
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
            margin: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            width: 1.sw,
            height: 200,
            child: Column(
              children: [
                Container(
                  width: 1.sw,
                  height: 180,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 340,
                        height: 100,

                        child: Container(
                          width: 1.sw,
                          height: 180,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        child: Text(
                                          _postsDataProduct
                                              .data.product[index].name,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        child: Text(
                                          _postsDataProduct
                                              .data.product[index].description,
                                        ),
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          _postsDataProduct
                                              .data.product[index].img,
                                        ), // 图片数组
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        // Image.network(
                        //   'https://img2.baidu.com/it/u=295131672,1212858880&fm=253&fmt=auto&app=138&f=JPEG?w=325&h=200',
                        //   fit: BoxFit.fill,
                        //   width: 400,
                        // ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.red,
                        ),
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
                                      child: const Text(' 特点3'),
                                    ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Image.network(
                  //   _postsDataProduct.data.product[index].img,
                  //   fit: BoxFit.contain,
                  //   height: 100,
                  //   width: 100,
                  // ),
                ),
              ],
            ),
            decoration: BoxDecoration(
//背景
              color: Colors.white,
              //设置四周圆角 角度
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              //设置四周边框
              border: Border.all(width: 1, color: Colors.white),
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
