import 'package:dio/dio.dart';

class DioHelper{

  static late Dio dio ;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://ecommerce.routemisr.com' ,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
  }) async{
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> getData({
    required url,
    Map<String,dynamic>? data,
    Map<String,dynamic>? query,
    String? token,
    String lang='ar',
  })async{
    dio.options.headers={
      'lang':lang,
      'Content-Type' : 'application/json',
      'Authorization' : token ?? ''
    };
    return await dio.get(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required url,
    Map<String,dynamic>? data,
    Map<String,dynamic>? query,
    String? token,
    String lang='ar',
  })async{
    dio.options.headers={
      'lang':lang,
      'Content-Type' : 'application/json',
      'Authorization' : token ?? ''
    };
    return await dio.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

}
