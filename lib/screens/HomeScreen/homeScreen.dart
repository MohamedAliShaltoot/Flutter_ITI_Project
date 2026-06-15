import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tickety/screens/HomeScreen/widgets/categoryChipsRow.dart';
import 'package:tickety/screens/HomeScreen/widgets/homeHeader.dart';
import 'package:tickety/screens/HomeScreen/widgets/horizontalEventList.dart';
import 'package:tickety/screens/HomeScreen/widgets/inviteFriendsBanner.dart';
import 'package:tickety/screens/HomeScreen/widgets/sectionHeader.dart';
import '../../core/constants/app_Colors.dart';
import '../../core/routes/app_routes.dart';
import '../EventsScreen/SearchScreen/searchScreen.dart';
import '../EventsScreen/widgets/reusableSearchField.dart';
import 'data/homeService.dart';
import 'homeTabBody.dart';
import 'models/eventCategoryModel.dart';
import 'models/homeEventModel.dart';
import '../EventsScreen/AllEventsScreen/allEventScreen.dart';
import '../EventsScreen/EmptyEvent/emptyEventScreen.dart';
import '../OrganizerProfileScreen/organizerProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeTabBody(),
    AllEventsScreen(),
    EmptyEventsScreen(),
    OrganizerProfileScreen(),
  ];

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: IndexedStack(
          index: _currentIndex,
          children: _tabs,
        ),
        bottomNavigationBar: HomeBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onNavTap,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}


