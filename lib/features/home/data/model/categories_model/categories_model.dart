import 'meta_data.dart';
import 'categories_data.dart';

class CategoriesModel {

  CategoriesModel.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? MetaData.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(CategoriesData.fromJson(v));
      });
    }
  }
  int? results;
  MetaData? metadata;
  List<CategoriesData> data =[];
}