import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tickety/screens/HomeScreen/widgets/homeBottomNavBar.dart';
import 'package:tickety/screens/mapScreen.dart';
import '../../core/constants/app_Colors.dart';
import 'homeTabBody.dart';
import '../EventsScreen/EmptyEvent/emptyEventScreen.dart';
import '../OrganizerProfileScreen/organizerProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // final List<Widget> _tabs = const [
  //   HomeTabBody(),
  //   AllEventsScreen(),
  //   EmptyEventsScreen(),
  //   OrganizerProfileScreen(),
  // ];

  final List<Widget> _tabs = const [
    HomeTabBody(),
    EmptyEventsScreen(),
    MapScreen(),
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


