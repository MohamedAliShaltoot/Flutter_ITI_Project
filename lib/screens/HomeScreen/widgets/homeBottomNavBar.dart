import 'package:flutter/material.dart';
import 'package:tickety/screens/HomeScreen/widgets/navItem.dart';

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
          NavItem(
            icon: Icons.explore,
            label: 'Explore',
            index: 0,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          NavItem(
            icon: Icons.calendar_today_outlined,
            label: 'Events',
            index: 1,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          const SizedBox(width: 40),
          NavItem(
            icon: Icons.map_outlined,
            label: 'Map',
            index: 2,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          NavItem(
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