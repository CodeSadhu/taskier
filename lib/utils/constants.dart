import 'package:appwrite/models.dart';
import 'package:appwrite_hack/utils/shared_prefs_helper.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static Size getSize(BuildContext context) => MediaQuery.of(context).size;
  static String accessToken = 'token';
  static String refreshToken = 'refresh';

  static void navigateToDashboard({
    required String providerAccessToken,
    required String providerRefreshToken,
  }) {
    SharedPrefs.setToken(providerAccessToken);
    SharedPrefs.setRefreshToken(providerRefreshToken);
  }
}
