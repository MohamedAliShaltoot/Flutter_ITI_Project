import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickety/screens/AuthScreens/signUpScreen/signUpScreen.dart';

import '../../defaultScreen.dart';
import '../../screens/AuthScreens/signInScreen/signInScreen.dart';
import '../../screens/EventsScreen/DetailsEventScreen/detailsEventScreen.dart';
import '../../screens/EventsScreen/EmptyEvent/emptyEventScreen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.eventsScreen:
        return MaterialPageRoute(builder: (_) => EventDetailsScreen());

      case AppRoutes.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case AppRoutes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());


      case AppRoutes.emptyEventsScreen:
        return MaterialPageRoute(builder: (_) => EmptyEventsScreen());

      default :
        return MaterialPageRoute(builder: (_) => Defaultscreen());
    }
  }
}
