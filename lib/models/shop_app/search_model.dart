// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  Data data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<SearchData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<SearchData>.from(json["data"].map((x) => SearchData.fromJson(x))),
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

class SearchData {
  SearchData({
    required this.id,
    this.price,
    this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  int? id;
  dynamic price;
  dynamic oldPrice;
  int ? discount;
  String? image;
  String? name;
  String? description;
  List<String> images;
  bool? inFavorites;
  bool? inCart;

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
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

// // To parse this JSON data, do
// //
// //     final favoritesModel = favoritesModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SearchModel favoritesModelFromJson(String str) =>
//     SearchModel.fromJson(json.decode(str));
//
// String favoritesModelToJson(SearchModel data) => json.encode(data.toJson());
//
// class SearchModel {
//   SearchModel({
//     required this.status,
//     this.message,
//     required this.data,
//   });
//
//   bool status;
//   dynamic message;
//   SearchData data;
//
//   factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
//         status: json["status"],
//         message: json["message"],
//         data: SearchData.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//       };
// }
//
// class SearchData {
//   SearchData({
//     this.currentPage,
//     required this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   int? currentPage;
//   List<Product> data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   dynamic nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;
//
//   factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
//         currentPage: json["current_page"],
//         data: List<Product>.from(
//             json["data"].map((x) => Product.fromJson(x))),
//         firstPageUrl: json["first_page_url"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         lastPageUrl: json["last_page_url"],
//         nextPageUrl: json["next_page_url"],
//         path: json["path"],
//         perPage: json["per_page"],
//         prevPageUrl: json["prev_page_url"],
//         to: json["to"],
//         total: json["total"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "first_page_url": firstPageUrl,
//         "from": from,
//         "last_page": lastPage,
//         "last_page_url": lastPageUrl,
//         "next_page_url": nextPageUrl,
//         "path": path,
//         "per_page": perPage,
//         "prev_page_url": prevPageUrl,
//         "to": to,
//         "total": total,
//       };
// }
//
//
//
// class Product {
//   Product({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.image,
//     required this.name,
//     this.description,
//   });
//
//   int id;
//   dynamic price;
//   dynamic oldPrice;
//   int discount;
//   String image;
//   String name;
//   String? description;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         price: json["price"],
//         oldPrice: json["old_price"],
//         discount: json["discount"],
//         image: json["image"],
//         name: json["name"],
//         description: json["description"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "price": price,
//         "old_price": oldPrice,
//         "discount": discount,
//         "image": image,
//         "name": name,
//         "description": description,
//       };
// }
