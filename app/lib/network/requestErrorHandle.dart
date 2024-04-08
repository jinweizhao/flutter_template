class RequestErrorHandle {
  // 处理 Http 错误码
  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;

      default:
        message = '请求失败，错误码：$errorCode';
    }
    // EasyLoading.showError(message);
  }
}
