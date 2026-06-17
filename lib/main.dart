import 'package:flutter/material.dart';
import 'core/constants/appConstants.dart';
import 'core/localDataSource/sharedPreferencesManager.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.instance.init();

  runApp(const TicketyApp());
}

class TicketyApp extends StatelessWidget {
  const TicketyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

