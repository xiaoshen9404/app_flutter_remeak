import 'package:dio/dio.dart';

class HttpInterceptor extends Interceptor {
  static const String TAG = "HttpInterceptor";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('$TAG : REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "$TAG : RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n data:${response}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        '$TAG : ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
