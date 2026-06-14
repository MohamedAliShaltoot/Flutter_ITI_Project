import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tickety/screens/HomeScreen/widgets/categoryChipsRow.dart';
import 'package:tickety/screens/HomeScreen/widgets/homeHeader.dart';
import 'package:tickety/screens/HomeScreen/widgets/horizontalEventList.dart';
import 'package:tickety/screens/HomeScreen/widgets/inviteFriendsBanner.dart';
import 'package:tickety/screens/HomeScreen/widgets/sectionHeader.dart';
import '../../core/constants/app_Colors.dart';
import '../../core/constants/imageAssets.dart';
import '../EventsScreen/widgets/reusableSearchField.dart';
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
        appBar: AppBar(

        ),
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


class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  HomeHeader(
                    location: 'New York, USA',
                    onMenuTap: () {},
                    onNotificationTap: () {},
                  ),
                  const SizedBox(height: 16),
                  const SearchInputField(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CategoryChipsRow(categories: categories, onCategoryTap: (c) {}),
            const SizedBox(height: 20),
            SectionHeader(title: 'Upcoming Events', onSeeAllTap: () {}),
            const SizedBox(height: 12),
            HorizontalEventList(events: upcomingEvents),
            const SizedBox(height: 20),
            InviteFriendsBanner(onInviteTap: () {}),
            const SizedBox(height: 20),
            SectionHeader(title: 'Nearby You', onSeeAllTap: () {}),
            const SizedBox(height: 12),
            HorizontalEventList(events: upcomingEvents),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class HomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.explore,
            label: 'Explore',
            index: 0,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          _NavItem(
            icon: Icons.calendar_today_outlined,
            label: 'Events',
            index: 1,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          const SizedBox(width: 40),
          _NavItem(
            icon: Icons.map_outlined,
            label: 'Map',
            index: 2,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          _NavItem(
            icon: Icons.person_outline,
            label: 'Profile',
            index: 3,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool active = index == currentIndex;
    final Color color = active ? AppColors.primaryColor : AppColors.unactiveNavColor;

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: color, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

final List<EventCategoryModel> categories = [
  EventCategoryModel(label: 'Sports', icon: Icons.sports_soccer, color: const Color(0xFFFF6B6B)),
  EventCategoryModel(label: 'Music', icon: Icons.music_note, color: const Color(0xFFFFA552)),
  EventCategoryModel(label: 'Food', icon: Icons.restaurant, color: const Color(0xFF4ECDC4)),
  EventCategoryModel(label: 'Art', icon: Icons.palette, color: const Color(0xFF6C63FF)),
];


final List<HomeEventModel> upcomingEvents = [
  HomeEventModel(
    imageUrl: ImageAssets.upComingImage,
    dateDay: '10',
    dateMonth: 'JUNE',
    title: 'International Band Muhghghfghdfhg',
    location: '36 Guild Street London, UK',
    imageBgColor: const Color(0xFFFBD8C9),
    attendeeAvatars: [ImageAssets.appLogo, ImageAssets.appLogo, ImageAssets.appLogo],
    extraGoingCount: 20,
  ),
  HomeEventModel(
    imageUrl: ImageAssets.upComingImage,
    dateDay: '10',
    dateMonth: 'JUNE',
    title: 'International Band Muhghghfghdfhg',
    location: 'Radius Gal...',
    imageBgColor: const Color(0xFF9BC5E5),
    attendeeAvatars: [ImageAssets.appLogo, ImageAssets.appLogo, ImageAssets.appLogo],
    extraGoingCount: 20,
  ),
  HomeEventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateDay: '10',
    dateMonth: 'JUNE',
    title: 'International Band Mu...',
    location: '36 Guild Street London, UK',
    imageBgColor: const Color(0xFFFBD8C9),
    attendeeAvatars: [ImageAssets.appLogo, ImageAssets.appLogo, ImageAssets.appLogo],
    extraGoingCount: 20,
  ),
  HomeEventModel(
    imageUrl: ImageAssets.upComingImage,
    dateDay: '10',
    dateMonth: 'JUNE',
    title: 'Jo Malone...',
    location: 'Radius Gal...',
    imageBgColor: const Color(0xFF9BC5E5),
    attendeeAvatars: [ImageAssets.upComingImage, ImageAssets.appLogo, ImageAssets.appLogo],
    extraGoingCount: 20,
  ),
];