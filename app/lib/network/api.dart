import 'httpRequest.dart';

class Api {
  ///login
  static Future<T> login<T>(Map<String, dynamic>? params) async {
    return await HttpRequest().get("url", params: params);
  }

  ///login
  static Future<T> login1<T>(Map<String, dynamic>? params) async {
    return await HttpRequest().get("https://httpbin.org/get", params: params);
  }
}
