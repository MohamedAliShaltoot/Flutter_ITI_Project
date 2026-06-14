import 'package:flutter/material.dart';
import 'package:tickety/screens/AuthScreens/signUpScreen/signUpScreen.dart';
import '../../defaultScreen.dart';
import '../../screens/AuthScreens/signInScreen/signInScreen.dart';
import '../../screens/EventsScreen/AllEventsScreen/allEventScreen.dart';
import '../../screens/EventsScreen/DetailsEventScreen/detailsEventScreen.dart';
import '../../screens/EventsScreen/EmptyEvent/emptyEventScreen.dart';
import '../../screens/EventsScreen/SearchScreen/searchScreen.dart';
import '../../screens/OrganizerProfileScreen/organizerProfileScreen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.eventDetailsScreen:
        return MaterialPageRoute(builder: (_) => EventDetailsScreen());

      case AppRoutes.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case AppRoutes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case AppRoutes.searchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());


      case AppRoutes.allEventsScreen:
        return MaterialPageRoute(builder: (_) => AllEventsScreen());


      case AppRoutes.emptyEventsScreen:
        return MaterialPageRoute(builder: (_) => EmptyEventsScreen());

      case AppRoutes.organizerProfileScreen:
        return MaterialPageRoute(builder: (_) => OrganizerProfileScreen());

      default :
        return MaterialPageRoute(builder: (_) => Defaultscreen());
    }
  }
}
