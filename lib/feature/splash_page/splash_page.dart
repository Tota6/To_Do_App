import 'dart:async';

import 'package:flutter/material.dart';

import '../register_page/regester_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RegisterPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
