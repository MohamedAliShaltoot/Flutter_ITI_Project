import 'package:flutter/material.dart';
import 'package:tickety/core/constants/app_Colors.dart';
import 'package:tickety/screens/EventsScreen/DetailsEventScreen/widgets/attendeesRow.dart';
import 'package:tickety/screens/EventsScreen/DetailsEventScreen/widgets/infoRow.dart';
import 'package:tickety/screens/EventsScreen/DetailsEventScreen/widgets/organizeRow.dart';
import '../../../core/constants/imageAssets.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/sharedWidgets/primaryButton.dart';
import '../../HomeScreen/models/homeEventModel.dart';


class EventDetailsScreen extends StatelessWidget {
  final HomeEventModel event;

  const EventDetailsScreen({super.key, required this.event});

  String get _dateLabel {
    if (event.dateDay == '--') return 'Date TBA';
    final year = event.dateYear.isNotEmpty ? ' ${event.dateYear}' : '';
    return '${event.dateDay} ${event.dateMonth}$year';
  }

  String get _timeLabel {
    return event.localTime.isNotEmpty ? event.localTime : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: PrimaryButton(
            label: 'BUY TICKET',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.emptyEventsScreen);
            },
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.black,
           leading: BackButton(color: AppColors.whiteColor),
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
            title: Text(
              event.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: event.imageUrl.isNotEmpty
                  ? Image.network(
                event.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: event.imageBgColor,
                  child: const Icon(Icons.image, color: Colors.white54),
                ),
              )
                  : Container(
                color: event.imageBgColor,
                child: const Icon(Icons.image, color: Colors.white54),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: AttendeesRow(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    event.title,
                    style: const TextStyle(
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
                  title: _dateLabel,
                  subtitle: _timeLabel,
                ),
                const SizedBox(height: 16),
                if (event.location != null)
                  InfoRow(
                    iconPath: ImageAssets.locationImage,
                    iconColor: const Color(0xFF5669FF),
                    title: event.location!,
                    subtitle: '',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    event.description?.trim().isNotEmpty == true
                        ? event.description!
                        : 'No additional details available for this event.',
                    style: const TextStyle(
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