import 'package:flutter/material.dart';
import 'package:tickety/core/constants/app_Colors.dart';
import 'package:tickety/screens/EventsScreen/DetailsEventScreen/widgets/attendeesRow.dart';
import 'package:tickety/screens/EventsScreen/DetailsEventScreen/widgets/infoRow.dart';
import 'package:tickety/screens/EventsScreen/DetailsEventScreen/widgets/organizeRow.dart';
import '../../../core/constants/imageAssets.dart';
import '../../AuthScreens/AuthWidgets/primaryAuthButton.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: PrimaryButton(label: 'BUY TICKET \$120', onTap: () {}),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.black,
            leading: const BackButton(color: Colors.white),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(ImageAssets.bookmarkImage),
                ),
              ),
            ],
            title: const Text(
              'Event Details',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                ImageAssets.eventDetailsImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: AttendeesRow(),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'International Band\nMusic Concert',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                InfoRow(
                  iconPath: ImageAssets.calendarImage,
                  iconColor: const Color(0xFF5669FF),
                  title: '14 December, 2021',
                  subtitle: 'Tuesday, 4:00PM - 9:00PM',
                ),
                const SizedBox(height: 16),
                InfoRow(
                  iconPath: ImageAssets.locationImage,
                  iconColor: const Color(0xFF5669FF),
                  title: 'Gala Convention Center',
                  subtitle: '36 Guild Street London, UK',
                ),
                const SizedBox(height: 16),

                OrganizerRow(),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'About Event',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Enjoy your favorite dishe and a lovely your friends and family and have a great time. '
                    'Food from local food trucks will be available for purchase.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
