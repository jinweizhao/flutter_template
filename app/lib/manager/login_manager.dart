import 'package:google_sign_in/google_sign_in.dart';

import '../const.dart';

/// 登录方式
enum LoginType { google, facebook }

typedef LoginCallBack = void Function(String token);

class MQLoginManager {
  // 单例
  factory MQLoginManager() => _getInstance();
  static MQLoginManager? _instance;
  static MQLoginManager _getInstance() {
    _instance ??= MQLoginManager._init();
    return _instance!;
  }

  MQLoginManager._init() {
    ///google 配置
    _initGoogleSignIn();
    //facebook 配置
  }

  Future<(bool, String)> logggggg({required LoginType type}) async {
    GoogleSignInAccount? account = await login(type: type);
    return (account != null) ? (true, account.id) : (false, "");
  }

  Future<GoogleSignInAccount?> login({required LoginType type}) async {
    switch (type) {
      case LoginType.google:
        _googleSignIn?.signOut();
        return await _googleSignIn?.signIn();
      case LoginType.facebook:
      // TODO: Handle this case.
    }
    return null;
  }

  GoogleSignIn? _googleSignIn;
  void _initGoogleSignIn() {
    _googleSignIn = GoogleSignIn(
      scopes: googleScopes,
    );
    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    _googleSignIn?.signInSilently();
  }
}
