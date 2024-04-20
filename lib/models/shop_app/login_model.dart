// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

ShopLoginModel loginModelFromJson(String str) => ShopLoginModel.fromJson(json.decode(str));

String loginModelToJson(ShopLoginModel data) => json.encode(data.toJson());

class ShopLoginModel {
  ShopLoginModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  UserData data;

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) => ShopLoginModel(
    status: json["status"],
    message: json["message"],
    data: UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    credit: json["credit"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
    "token": token,
  };
}




// class ShopLoginModel
// {
//    bool? status ;
//    late String  message;
//    UserData? data ;
//   ShopLoginModel.fromJson(Map<String , dynamic> json)
//   {
//     status = json['status'];
//     message = json['message'];
//     // ignore: unnecessary_null_in_if_null_operators
//     data = json['data'] != null ? UserData.formJson(json['data']) : null ;
//
//   }
// }
// class UserData
// {
//    int? id ;
//     late String name ;
//     String? email ;
//    String? phone ;
//   late String image ;
//   late int points ;
//   late int credit ;
//   late String token ;
//
// //   UserData ({
// //     this.email,
// //     this.image,
// //     this.id,
// //     this.name,
// //     this.points,
// //     this.credit,
// //     this.token,
// // });
// // ignore: empty_constructor_bodies
//   UserData.formJson(Map<String , dynamic> json)
// {
// id = json['id'];
// email = json['email'];
// image = json['image'];
// name = json['name'];
// points = json['points'];
// credit = json['credit'];
// token = json['token'];
// }
//
// }