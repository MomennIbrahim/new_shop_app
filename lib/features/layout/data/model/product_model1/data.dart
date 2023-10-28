import 'products.dart';

class ProductData {

  ProductData.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }
  List<Products>? products;
  String? ad;


}