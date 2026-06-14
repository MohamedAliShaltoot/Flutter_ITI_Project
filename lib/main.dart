import 'package:flutter/material.dart';
import 'package:tickety/screens/EventsScreen/EmptyEvent/emptyEventScreen.dart';
import 'package:tickety/screens/OnBoardingScreens/SplashScreen/splashScreen.dart';
import 'core/constants/appConstants.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';

void main() {
  runApp(TicketyApp());
}

class TicketyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: AppConstants.appName,
     //initialRoute: AppRoutes.emptyEventsScreen,
     initialRoute: AppRoutes.eventDetailsScreen,
     onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
