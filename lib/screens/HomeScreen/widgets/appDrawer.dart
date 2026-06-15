import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../models/drawerItemModel.dart';
import 'appDrawerHeader.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String? avatarUrl;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
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
              email: userEmail,
              avatarUrl: avatarUrl,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.organizerProfileScreen);
              },
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  DrawerItem(
                    icon: Icons.confirmation_num_outlined,
                    label: 'My Tickets',
                    onTap: () {
                      Navigator.pop(context);
                                         },
                  ),
                  DrawerItem(
                    icon: Icons.favorite_border,
                    label: 'Favorites',
                    onTap: () {
                      Navigator.pop(context);
                                         },
                  ),
                  DrawerItem(
                    icon: Icons.notifications_none,
                    label: 'Notifications',
                    onTap: () {
                      Navigator.pop(context);
                                         },
                  ),
                  DrawerItem(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    onTap: () {
                      Navigator.pop(context);
                                         },
                  ),
                  DrawerItem(
                    icon: Icons.help_outline,
                    label: 'Help & Support',
                    onTap: () {
                      Navigator.pop(context);
                                         },
                  ),
                  const Divider(height: 24, indent: 16, endIndent: 16),
                  DrawerItem(
                    icon: Icons.logout,
                    label: 'Log out',
                    iconColor: Colors.red,
                    textColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                     
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'v1.0.0',
                style: TextStyle(color: Colors.grey, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}