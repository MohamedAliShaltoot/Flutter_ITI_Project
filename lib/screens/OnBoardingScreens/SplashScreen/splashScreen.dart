// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tickety/core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';
import '../OnBoardingScreens/OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
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
