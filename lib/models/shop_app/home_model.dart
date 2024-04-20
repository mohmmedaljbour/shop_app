import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.banners,
    required this.products,
  });

  List<Banner> banners;
  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    required this.id,
    required this.image,
  });

  int id;
  String image;
  dynamic category;
  dynamic product;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class Product {
  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}

// class HomeModel
// {
//    bool? status;
//   HomeDataModel? data ;
//
//    HomeModel.formJson(Map<String , dynamic>? json){
//
//     status = json?['status'];
//     data = HomeDataModel.fromJson(json?['data']);
//   }
//
// }
//
// class HomeDataModel
// {
//   List<BannerModel> banners =[];
//   List<ProductModel> products=[] ;
//
//   HomeDataModel.fromJson(Map<String , dynamic> json){
//
//     json['banners'].forEach((element){
//       banners.add(element);
//     });
//     json['products'].forEach((element){
//       products.add(element);
//     });
//
//   }
// }
//
// class BannerModel{
//    int? id ;
//    String? image ;
//    BannerModel.fromJson(Map<String , dynamic> json){
//     id =  json['id'];
//     image =json['image'];
//
//   }
// }
//
// class ProductModel{
//   int? id ;
//   dynamic  price ;
//   dynamic oldPrice;
//   dynamic discount;
//   String? image;
//   String? name;
//   bool? inFavorites;
//   bool? inCart;
//
//   ProductModel.fromJson(Map<String , dynamic> json){
//     id =  json['id'];
//     price =  json['price'];
//     oldPrice =  json['old_price'];
//     discount =  json['discount'];
//     image =  json['image'];
//     name =  json['name'];
//     inFavorites =  json['in_favorites'];
//     inCart =  json['in_cart'];
//
//   }
// }
