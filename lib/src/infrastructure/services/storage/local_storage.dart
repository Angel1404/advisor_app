import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/models/role_type_enum.dart';

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

  String? get getUserId => _prefs.getString('user_id');
  set setUserRole(String value) {
    _prefs.setString('role', value);
  }

  RoleType get getUserRole => RoleType.strToRoleType(_prefs.getString('role') ?? '');

  set setUserName(String value) {
    _prefs.setString('name_user', value);
  }

  String? get getUserName => _prefs.getString('name_user') ?? '';

  clearPreferences() async {
    await _prefs.clear();
  }
}
