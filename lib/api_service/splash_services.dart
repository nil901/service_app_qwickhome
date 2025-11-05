import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import '../dashboard/main_home_screen.dart';
import '../prefs/app_preference.dart';
import '../prefs/preferece_keys.dart';


class SplashServices {
  Future<void> checkAuthentication(BuildContext context) async {

    final token = AppPreference().getInt(PreferencesKey.userId);


    debugPrint('User Token: $token');


    await Future.delayed(const Duration(seconds: 2));

    if (token == null || token == 0) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );
    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  MainHomeScreen()),
      );
    }
  }
}
