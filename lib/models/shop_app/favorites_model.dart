// To parse this JSON data, do
//
//     final favoritesModel = favoritesModelFromJson(jsonString);

import 'dart:convert';

FavoritesModel favoritesModelFromJson(String str) =>
    FavoritesModel.fromJson(json.decode(str));

String favoritesModelToJson(FavoritesModel data) => json.encode(data.toJson());

class FavoritesModel {
  FavoritesModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  Data data;

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
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
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<FavoritesData> data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<FavoritesData>.from(
            json["data"].map((x) => FavoritesData.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class FavoritesData {
  FavoritesData({
    required this.id,
    required this.product,
  });

  int id;
  Product product;

  factory FavoritesData.fromJson(Map<String, dynamic> json) => FavoritesData(
        id: json["id"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
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
    this.description,
  });

  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String? description;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"].toDouble(),
        oldPrice: json["old_price"].toDouble(),
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
      };
}
