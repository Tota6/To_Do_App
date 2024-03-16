import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/config/themes/app_colors.dart';
import 'package:todo_app/config/themes/app_themes.dart';
import 'package:todo_app/feature/login_page/login_page.dart';
import 'package:todo_app/feature/settings_page/settings_tab.dart';
import 'package:todo_app/firebase_options.dart';
import 'feature/home_page/home_page.dart';
import 'feature/register_page/regester_page.dart';
import 'feature/splash_page/splash_page.dart';
import 'feature/todo_list_page/todo_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppColors.isDarkSelected
          ? AppThemeData.darkTheme
          : AppThemeData.lightTheme,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePage.routeName: (context) => const HomePage(),
        ToDoListTab.routeName: (context) => const ToDoListTab(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        SettingTab.routeName: (context) => const SettingTab(),
        LoginPage.routeName: (context) => const LoginPage(),
      },
      initialRoute: SplashScreen.routeName,
      home: const HomePage(),
    );
  }
}
