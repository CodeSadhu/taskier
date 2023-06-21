import 'package:appwrite_hack/models/task_model.dart';
import 'package:appwrite_hack/providers/common_provider.dart';
import 'package:appwrite_hack/screens/dashboard.dart';
import 'package:appwrite_hack/screens/login.dart';
import 'package:appwrite_hack/utils/app_routes.dart';
import 'package:appwrite_hack/utils/appwrite_service.dart';
import 'package:appwrite_hack/utils/colors.dart';
import 'package:appwrite_hack/utils/constants.dart';
import 'package:appwrite_hack/utils/shared_prefs_helper.dart';
import 'package:appwrite_hack/utils/strings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  configureAppwrite();
  await initializeHive();
  await SharedPrefs.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CommonProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(Strings.tasks);
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
      themeMode: ThemeMode.light,
      routes: AppRoutes.getAppRoutes,
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: Strings.appFont,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPalette.background,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.white,
        ),
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
  late CommonProvider _commonProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = SharedPrefs.getToken();
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
  }

  void checkConnection() async {
    final ConnectivityResult state = await Connectivity().checkConnectivity();
    if (state == ConnectivityResult.mobile ||
        state == ConnectivityResult.wifi ||
        state == ConnectivityResult.ethernet ||
        state == ConnectivityResult.vpn) {
      _commonProvider.connectionChanged(true);
    }
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
