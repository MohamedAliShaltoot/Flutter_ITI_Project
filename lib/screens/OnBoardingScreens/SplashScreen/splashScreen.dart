import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tickety/core/constants/app_Colors.dart';
import 'package:tickety/core/constants/imageAssets.dart';
import '../../../core/localDataSource/sharedPreferencesManager.dart';
import '../../../core/routes/app_routes.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = SharedPreferencesManager.instance;

    String route;
    if (!prefs.hasSeenOnboarding) {
      route = AppRoutes.onboardingScreen;
    } else if (prefs.isLoggedIn) {
      route = AppRoutes.homeScreen;
    } else {
      route = AppRoutes.signInScreen;
    }

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBGColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.fullAppLogoImage, width: 242, height: 150),
          ],
        ),
      ),
    );
  }
}