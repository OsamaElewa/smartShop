import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  String? productId;
  String? productTitle;
  String? productImage;
  int? productCategory;
  String? productDescription;
  String? productPrice;
  int? productQuantity;
  Timestamp? createdAt;



  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.productCategory,
    required this.productQuantity,
    required this.productImage,
    required this.createdAt
  });


  ProductModel.fromJson(Map<String, dynamic> json){
    productId = json['productId'];
    productTitle = json['productTitle'];
    productDescription = json['productDescription'];
    productPrice = json['productPrice'];
    productCategory = json['productCategory'];
    productQuantity = json['productQuantity'];
    productImage = json['productImage'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productTitle': productTitle,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productQuantity': productQuantity,
      'productImage': productImage,
      'createdAt': createdAt
    };
  }
}