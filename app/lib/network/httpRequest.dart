import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../manager/local_storage.dart';
import 'config.dart';

class HttpRequest {
  static final HttpRequest _singletonRequestClient = HttpRequest._internal();
  factory HttpRequest() => _singletonRequestClient;

  static final BaseOptions options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: Config.connectTimeOut,
      receiveTimeout: Config.receiveTimeOut);
  static final Dio _dio = Dio(options);
  static final httpHeaders = {
    'Content-Type': 'application/json',
    'X-App-Version': '1.1',
    'X-App-Channel': 'apple',
  };
  HttpRequest._internal() {
    ///初始化 dio 配置
    _dio
      ..interceptors.add(CustomInterceptors())
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: false,
          maxWidth: 90));

    _dio.options.headers = httpHeaders;
  }

  // get 请求
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    Response response;
    response = await _request(url, params: params, method: "GET");
    return response.data;
  }

  // post 请求
  Future<dynamic> post(String url, {Map<String, dynamic>? params}) async {
    Response response;
    response = await _request(url, params: params, method: "POST");
    return response.data;
  }

  //请求基类
  _request(String url,
      {Map<String, dynamic>? params, String method = "GET"}) async {
    Response response;
    response = await _dio.request(url,
        options: Options(
          method: method,
        ),
        queryParameters: params);
    return response;
  }
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = LocalStorage.getString("token");
    options.headers["language"] = LocalStorage.getString("language");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
    if (response.statusCode == 200 || response.statusCode == 201) {}
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。

    super.onError(err, handler);
  }
}
