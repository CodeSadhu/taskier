import 'package:appwrite_hack/screens/login.dart';
import 'package:appwrite_hack/utils/appwrite_config.dart';
import 'package:appwrite_hack/utils/colors.dart';
import 'package:appwrite_hack/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureAppwrite();
  runApp(const MyApp());
}

void configureAppwrite() {
  Client client = Client();
  client
      .setEndpoint(AppwriteStuff.baseUrl)
      .setProject(AppwriteStuff.projectId)
      .setSelfSigned();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Constants.getSize(context);
    return LoginPage();
  }
}
