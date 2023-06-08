import 'package:appwrite_hack/screens/login.dart';
import 'package:appwrite_hack/screens/signup.dart';
import 'package:appwrite_hack/utils/app_routes.dart';
import 'package:appwrite_hack/utils/appwrite_service.dart';
import 'package:appwrite_hack/utils/colors.dart';
import 'package:appwrite_hack/utils/constants.dart';
import 'package:appwrite_hack/utils/shared_prefs_helper.dart';
import 'package:appwrite_hack/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  configureAppwrite();
  SharedPrefs.init();
  runApp(const MyApp());
}

void configureAppwrite() {
  AppwriteService.initialize(
    endpoint: Strings.baseUrl,
    projectId: Strings.projectId,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const MainPage(),
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.signup: (context) => const SignupPage(),
      },
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: Strings.appFont,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPalette.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.primary,
        ),
      ),
      scaffoldBackgroundColor: ColorPalette.background,
      primaryColor: ColorPalette.primary,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Constants.getSize(context);
    return LoginPage();
  }
}
