class TestModel {
  String? message;
  TestData? user;
  String? token;

  TestModel.fromJson(Map<String,dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? TestData.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class TestData {
  String? name;
  String? email;
  String? role;

  TestData.fromJson(Map<String,dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
