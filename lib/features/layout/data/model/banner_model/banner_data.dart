class BannerData {

  int? id;
  String? image;

  BannerData.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }

}