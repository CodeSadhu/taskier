import 'package:appwrite_hack/screens/task_form.dart';
import 'package:flutter/material.dart';
import 'package:appwrite_hack/main.dart';
import 'package:appwrite_hack/screens/dashboard.dart';
import 'package:appwrite_hack/screens/login.dart';
import 'package:appwrite_hack/screens/signup.dart';

class AppRoutes {
  AppRoutes._();

  static const String initial = '/';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String dashboard = 'dashboard';
  static const String taskForm = 'task_form';

  static Map<String, WidgetBuilder> get getAppRoutes {
    return {
      AppRoutes.initial: (context) => const MainPage(),
      AppRoutes.login: (context) => const LoginPage(),
      AppRoutes.signup: (context) => const SignupPage(),
      AppRoutes.dashboard: (context) => const DashboardPage(),
      AppRoutes.taskForm: (context) => const TaskForm(),
    };
  }
}
