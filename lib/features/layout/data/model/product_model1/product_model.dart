import 'data.dart';

class ProductModel {


  ProductModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProductData.fromJson(json['data']) : null;
  }
  bool? status;
  dynamic message;
  ProductData? data;


}