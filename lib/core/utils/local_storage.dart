import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage{

  static FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

 static Future<void> setData({
    required String key,
    required dynamic value,
})async{
   return await flutterSecureStorage.write(key: key, value: value);
  }

   static dynamic getData({
    required String key,
  }){
    return flutterSecureStorage.read(key: key);
  }

  static Future removeData({
    required String key,
  })async{
    return await flutterSecureStorage.delete(key: key);
  }

}