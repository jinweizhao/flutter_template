class ResponseModel<T> {
  late final int code;
  late final String? message;
  late final T? data;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int;
    if (null != json['message']) {
      message = json['message'] as String;
    }
  }
}
