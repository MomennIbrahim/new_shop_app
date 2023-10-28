import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://student.valuxapps.com/api/';
  late final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };
    _dio.options.sendTimeout = (const Duration(seconds: 30));
    _dio.options.receiveTimeout = (const Duration(seconds: 30));
    _dio.options.connectTimeout = (const Duration(seconds: 30));
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.baseUrl = _baseUrl;

    var response = await _dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getData2({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };
    _dio.options.sendTimeout = (const Duration(seconds: 60));
    _dio.options.receiveTimeout = (const Duration(seconds: 60));
    _dio.options.connectTimeout = (const Duration(seconds: 60));
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.baseUrl = 'https://ecommerce.routemisr.com';

    var response = await _dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }


  Future<dynamic> postData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };
    _dio.options.sendTimeout = (const Duration(seconds: 60));
    _dio.options.receiveTimeout = (const Duration(seconds: 60));
    _dio.options.connectTimeout = (const Duration(seconds: 60));
    var response = await _dio.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
    return response.data;
  }


  Future<dynamic> putData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token??'',
    };
    _dio.options.sendTimeout = (const Duration(seconds: 60));
    _dio.options.receiveTimeout = (const Duration(seconds: 60));
    _dio.options.connectTimeout = (const Duration(seconds: 60));

    var response = await _dio.put(
      endPoint,
      queryParameters: query,
      data: data,
    );
    return response.data;
  }
}
