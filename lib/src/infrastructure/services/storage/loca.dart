import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences extends ChangeNotifier {
  static final LocalPreferences _instance = LocalPreferences._internal();

  factory LocalPreferences() {
    return _instance;
  }

  LocalPreferences._internal();
  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set logIn(bool value) {
    _prefs.setBool('logged', value);
  }

  get getLoginState => _prefs.getBool('logged');
  set setUserId(String value) {
    _prefs.setString('user_id', value);
  }

  get getUserId => _prefs.getString('user_id');
}
