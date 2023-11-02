library user_authentication;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:user_authentication/user.dart';
import 'package:user_authentication/user_auth_service.dart';
export 'user.dart';

const String KEY_AUTH_TOKEN = "auth_token";
const String KEY_AUTH_REFRESH_TOKEN = "auth_refresh_token";

class UserAuthentication {

  final storage = new FlutterSecureStorage();
  final authRepo = new UserAuthenticationRepo();

  bool emailValidate({required String email})  {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  Future<String?> getAuthToken() async {
    return await storage.read(key: KEY_AUTH_TOKEN);
  }

  Future<String?> getRefreshAuthToken() async {
    return await storage.read(key: KEY_AUTH_REFRESH_TOKEN);
  }

  bool isAuthenticated() {
    return false;
  }

  bool passwordValidate({required String password})  {
    /** Validation rule as:
     * Minimum 1 Upper case
     * Minimum 1 lowercase
     * Minimum 1 Numeric Number
     * Minimum 1 Special Character
     * Common Allow Character ( ! @ # $ & * ~ )*/
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return RegExp(pattern)
        .hasMatch(password);
  }

  Future<AuthUser> logInWithEmailAndPassword({required String email, required String password}) async {
    // Todo Logic to call API
    var loginJSON = await authRepo.logInWithEmailAndPassword(email: email, password: password);
    // Todo  parse JSON and get auth token and refresh token
    final newAuthToken = "first_auth_token";
    final newAuthRefreshToken = "first_auth_refresh_token";
    await storage.write(key: KEY_AUTH_TOKEN, value: newAuthToken);
    await storage.write(key: KEY_AUTH_REFRESH_TOKEN, value: newAuthRefreshToken);
    return AuthUser(email, newAuthToken, newAuthRefreshToken);
  }
  Future<AuthUser> signUp({required String email, required String password}) async {
    // Todo Logic to call API
    var loginJSON = await authRepo.signUp(email: email, password: password);
    // Todo  parse JSON and get auth token and refresh token
    final newAuthToken = "first_auth_token";
    final newAuthRefreshToken = "first_auth_refresh_token";
    await storage.write(key: KEY_AUTH_TOKEN, value: newAuthToken);
    await storage.write(key: KEY_AUTH_REFRESH_TOKEN, value: newAuthRefreshToken);
    return AuthUser(email, newAuthToken, newAuthRefreshToken);
  }

  Future<bool> updateAuthToken() async {
    String? refreshToken = await getRefreshAuthToken();
    if(refreshToken != null) {
      var loginJSON = await authRepo.updateAuthToken(refreshToken: refreshToken);
      // Todo  parse JSON and get auth token and refresh token
      final newAuthToken = "first_auth_token";
      final newAuthRefreshToken = "first_auth_refresh_token";
      await storage.write(key: KEY_AUTH_TOKEN, value: newAuthToken);
      await storage.write(key: KEY_AUTH_REFRESH_TOKEN, value: newAuthRefreshToken);
      return true;
    }
    return false;
  }

  Future<bool> logOut() async {
    try {
      await storage.delete(key: KEY_AUTH_TOKEN);
      await storage.delete(key: KEY_AUTH_REFRESH_TOKEN);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

}
