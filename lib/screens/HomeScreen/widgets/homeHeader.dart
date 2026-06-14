import 'package:flutter/material.dart';


class HomeHeader extends StatelessWidget {
  final String location;
  final VoidCallback onMenuTap;
  final VoidCallback onNotificationTap;

  const HomeHeader({
    super.key,
    required this.location,
    required this.onMenuTap,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onMenuTap,
          child: const Icon(Icons.menu, color: Colors.white, size: 26),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Current Location',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, color: Colors.white70, size: 16),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              location,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onNotificationTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.notifications_none, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}