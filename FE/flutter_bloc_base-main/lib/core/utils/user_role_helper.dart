import 'package:flutter_starter/core/utils/user_preferences.dart';

class UserRoleHelper {
  /// Check if current user is admin based on stored userRole
  static Future<bool> isAdmin() async {
    return await UserPreferences.isAdmin();
  }

  /// Check if current user is regular user based on stored userRole
  static Future<bool> isUser() async {
    final role = await UserPreferences.getUserRole();
    return role?.toUpperCase() == 'USER';
  }

  /// Get current user role
  static Future<String?> getUserRole() async {
    return await UserPreferences.getUserRole();
  }
}
