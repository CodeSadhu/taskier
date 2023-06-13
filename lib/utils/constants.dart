import 'package:appwrite_hack/utils/app_routes.dart';
import 'package:appwrite_hack/utils/shared_prefs_helper.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;
  static String accessToken = 'token';
  static String refreshToken = 'refresh';

  static void navigateToDashboard({
    required String userId,
    String? providerAccessToken,
    String? providerRefreshToken,
  }) {
    SharedPrefs.setToken(userId);
    // SharedPrefs.setToken(providerAccessToken);
    // SharedPrefs.setRefreshToken(providerRefreshToken);
    Navigator.pushReplacementNamed(
        rootKey.currentContext!, AppRoutes.dashboard);
  }

  static void logout() {
    SharedPrefs.clearPreferences().then((value) {
      Navigator.pushReplacementNamed(rootKey.currentContext!, '/');
    });
  }
}
