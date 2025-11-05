import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_service/api_services.dart';
import '../prefs/app_preference.dart';
import '../prefs/preferece_keys.dart';
import '../utils/enum.dart';
import 'login_page.dart';

class Logout {
  Future<void> logoutUser(BuildContext context, WidgetRef ref) async {
    try {
      // 👇 Get current logged-in user ID
      final userId = await AppPreference().getInt(PreferencesKey.userId);

      // 👇 Print user ID to console
      print("🔹 Logging out user with ID: $userId");


      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not found!")),
        );
        return;
      }

      // 👇 API Call
      final response = await ApiService.postRequest(
        'logout',
        {'user': userId.toString()},
      );


      print("🔹 Logout API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        await AppPreference().clearSharedPreferences();

        ref
            .read(bottomTabProvider.notifier)
            .state = BottomTab.home;

        AppPreference().getString(
          PreferencesKey.name,

        );

        AppPreference().getString(
          PreferencesKey.email,

        );

        // 👇 Navigate to login screen and clear backstack
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
        );

        // 👇 Show confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(response.data['message'] ?? "Logout successful")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'] ?? "Logout failed")),
        );
      }
    } catch (e) {
      print("❌ Logout error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error during logout: $e")),
      );
    }
  }
}