import 'package:dio/dio.dart';

enum HttpEnvironment {
  dev,
  online,
}

class Config {
  static const HttpEnvironment environment = HttpEnvironment.dev;
  static const String baseUrl =
      environment == HttpEnvironment.dev ? _devBaseUrl : _onlineBaseUrl;
  static const Duration connectTimeOut = Duration(seconds: 10);
  static const Duration receiveTimeOut = Duration(seconds: 10);
  static const successCode = 200;
  static const responseType = ResponseType.json;

  static const String _devBaseUrl = "https://handynovelrest.handynovel.com/v1/";
  static const String _onlineBaseUrl =
      "https://handynovelrest.handynovel.com/v1/";

  BaseOptions getBaseOptions() {
    return BaseOptions(
      baseUrl: baseUrl,
    );
  }
}
