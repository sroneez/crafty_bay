import 'dart:convert';

import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _tokenKey = 'token';
  final String _userData = 'token';

  String? token;
  UserModel? user;

  Future<void> saveUserData(String accessToken, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, accessToken);
    sharedPreferences.setString(_userData, jsonEncode(userModel.toJson()));
    token = accessToken;
    user = userModel;
  }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(_tokenKey);
    String? userData = sharedPreferences.getString(_userData);
    if (userData != null) {
      user = UserModel.fromJson(jsonDecode(userData));
    }
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = await sharedPreferences.getString(_tokenKey);
    if (accessToken != null) {
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    token = null;
    user = null;
  }
}
