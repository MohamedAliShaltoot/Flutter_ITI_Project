import 'package:flutter/material.dart';
import '../models/drawerItemModel.dart';
import 'appDrawerHeader.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String? avatarUrl;

  const AppDrawer({
    super.key,
    required this.userName,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppDrawerHeader(
              name: userName,
              avatarUrl: avatarUrl,
              onTap: () => Navigator.pop(context),
            ),

            const Divider(height: 1, indent: 20, endIndent: 20),
            const SizedBox(height: 8),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                children: [
                  DrawerItem(
                    icon: Icons.person_outline,
                    label: 'My Profile',
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerItem(
                    icon: Icons.chat_bubble_outline,
                    label: 'Message',
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerItem(
                    icon: Icons.calendar_month_outlined,
                    label: 'Calendar',
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerItem(
                    icon: Icons.bookmark_border,
                    label: 'Bookmark',
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerItem(
                    icon: Icons.mail_outline,
                    label: 'Contact Us',
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerItem(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerItem(
                    icon: Icons.help_outline_rounded,
                    label: 'Helps & FAQs',
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerItem(
                    icon: Icons.logout_rounded,
                    label: 'Sign Out',
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7BDCF5), Color(0xFF3AB4D4)],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.workspace_premium, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Upgrade Pro',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}