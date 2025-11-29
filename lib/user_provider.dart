import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  static const String _usernameKey = 'username_key';

  String _username = '';
  String get username => _username;

  UserProvider() {
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString(_usernameKey) ?? '';
    notifyListeners();
  }

  Future<void> saveUsername(String newName) async {
    _username = newName;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, newName);
  }
}
