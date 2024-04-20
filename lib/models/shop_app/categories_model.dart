// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  Data data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
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
  });

  int currentPage;
  List<DataModel> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<DataModel>.from(json["data"].map((x) => DataModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataModel {
  DataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}


// class CategoriesModel
// {
//   bool? status;
//   CategoriesDataModel? data;
//   CategoriesModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     data =CategoriesDataModel.fromJson(json['data']);
//
//   }
// }
// class CategoriesDataModel
// {
//   int? currentPage ;
//   List<DataModel> data = [];
//
//   CategoriesDataModel.fromJson(Map<String, dynamic> json){
//     currentPage = json['current_page'];
//     json['data'].forEach((element){
//       data.add(DataModel.fromJson(json['data']));
//     });
//   }
//
// }
// class DataModel {
//   int? id ;
//   late String name;
//   late String image;
//
//   DataModel.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name =json['name'];
//     image =json['image'];
//
//   }
//
// }