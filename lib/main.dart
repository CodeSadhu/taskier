import 'package:appwrite_hack/screens/dashboard.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  configureAppwrite();
  await SharedPrefs.init();
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
      navigatorKey: Constants.rootKey,
      title: 'Flutter Demo',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.initial: (context) => const MainPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.signup: (context) => const SignupPage(),
        AppRoutes.dashboard: (context) => const DashboardPage(),
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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = SharedPrefs.getToken();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      return const LoginPage();
    } else {
      return const DashboardPage();
    }
  }
}
