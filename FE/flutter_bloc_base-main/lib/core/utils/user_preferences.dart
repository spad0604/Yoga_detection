import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_starter/data/entities/response/get_information.dart';

class UserPreferences {
  static const String _keyUserInfo = 'user_info';
  static const String _keyIsAdmin = 'is_admin';
  static const String _keyUserRole = 'user_role';

  static Future<void> saveUserInfo(GetInformation userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(userInfo.toJson());
    await prefs.setString(_keyUserInfo, jsonString);
    await prefs.setBool(_keyIsAdmin, userInfo.role?.toUpperCase() == 'ADMIN');
    if (userInfo.role != null) {
      await prefs.setString(_keyUserRole, userInfo.role!);
    }
  }

  /// Save user role directly from login/register response
  static Future<void> saveUserRole(String? userRole) async {
    if (userRole == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserRole, userRole);
    await prefs.setBool(_keyIsAdmin, userRole.toUpperCase() == 'ADMIN');
  }

  static Future<GetInformation?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyUserInfo);
    if (jsonString == null) return null;

    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return GetInformation.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> isAdmin() async {
    final prefs = await SharedPreferences.getInstance();
    final userRole = prefs.getString(_keyUserRole);
    return userRole?.toUpperCase() == 'ADMIN';
  }

  static Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserRole);
  }

  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserInfo);
    await prefs.remove(_keyIsAdmin);
    await prefs.remove(_keyUserRole);
  }
}
