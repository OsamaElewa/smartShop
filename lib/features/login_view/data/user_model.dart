import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  String? userId;
  String? userName;
  String? userImage;
  String? userEmail;
  String? userPassword;

  Timestamp? createdAt;

  List? userWishList;
  List? userCart;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userPassword,
    required this.userImage,
    required this.userEmail,
    required this.createdAt,
    required this.userCart,
    required this.userWishList
  });


  UserModel.fromJson(Map<String, dynamic> json){
    userEmail = json['userEmail'];
    userName = json['userName'];
    userPassword = json['userPassword'];
    userId = json['userId'];
    userImage = json['userImage'];
    userWishList = json['userWishList'];
    userCart = json['userCart'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userEmail': userEmail,
      'userName': userName,
      'userPassword': userPassword,
      'userId': userId,
      'userImage': userImage,
      'userWishList': userWishList,
      'userCart': userCart,
      'createdAt': createdAt
    };
  }
}