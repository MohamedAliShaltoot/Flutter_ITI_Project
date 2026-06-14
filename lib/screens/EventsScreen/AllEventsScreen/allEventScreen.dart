import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../models/eventModel.dart';
import '../widgets/eventListView.dart';
import '../widgets/reusableTopBar.dart';

class AllEventsScreen extends StatelessWidget {
  const AllEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FB),
      body: SafeArea(
        child: Column(
          children: [
            ScreenTopBar(
              title: 'Events',
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: Color(0xFF1A1A2E)),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.searchScreen);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Color(0xFF1A1A2E)),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(child: EventListView(events: allEvents)),
          ],
        ),
      ),
    );
  }
}