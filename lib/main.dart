import 'package:flutter/material.dart';
import 'package:tickety/screens/EventsScreen/EmptyEvent/emptyEventScreen.dart';
import 'package:tickety/screens/OnBoardingScreens/SplashScreen/splashScreen.dart';
import 'core/constants/appConstants.dart';

void main() {
  runApp(TicketyApp());
}

class TicketyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: AppConstants.appName,
     // home: SplashScreen());
      home: EmptyEventsScreen());
  }
}
