import 'banner_data.dart';

class BannerModel {
  
  bool? status;
  List<BannerData> bannerData = [];
  
  BannerModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      bannerData = [];
      json['data'].forEach((v) {
        bannerData.add(BannerData.fromJson(v));
      });
    }
  }
}