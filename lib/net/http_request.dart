import 'dart:convert';

import 'package:app_flutter_remeak/net/net_interceptor.dart';
import 'package:dio/dio.dart';

import 'configs.dart';

class HttpRequest {
  static final Dio _dio = Dio(BaseOptions(
      baseUrl: HttpConfig.baseUrl, receiveTimeout: HttpConfig.receiveTimeout));

  static Dio _getDio() {
    if (_dio.interceptors.isEmpty) {
      _dio.interceptors.add(HttpInterceptor());
    }
    return _dio;
  }

  static Future<Response<T>> postRequest<T>(String apiPath) async {
    try {
      Options options = Options(method: "post");
      return _getDio().request(apiPath, options: options);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  static Future<Response> getRequest(String apiPath,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Options options = Options(method: "get");
      return _getDio()
          .request(apiPath, options: options, queryParameters: queryParameters);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
