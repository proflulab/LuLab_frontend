import 'dart:convert';

Train trainFromJson(String str) => Train.fromJson(json.decode(str));

String trainToJson(Train data) => json.encode(data.toJson());

class Train {
  Train({
    required this.data,
  });

  final ProductData data;

  factory Train.fromJson(Map<String, dynamic> json) => Train(
        data: ProductData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ProductData {
  ProductData({
    required this.product,
  });

  final List<Product> product;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.name,
    required this.img,
    required this.description,
    required this.detailurl,
    required this.applyurl,
    required this.trait,
  });

  final String name;
  final String img;
  final String description;
  final String detailurl;
  final String applyurl;
  final List<String> trait;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        img: json["img"],
        description: json["description"],
        detailurl: json["detailurl"],
        applyurl: json["applyurl"],
        trait: List<String>.from(json["trait"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "description": description,
        "detailurl": detailurl,
        "applyurl": applyurl,
        "trait": List<dynamic>.from(trait.map((x) => x)),
      };
}
