import 'package:flutter/material.dart';
import 'package:tickety/screens/OrganizerProfileScreen/tabs/aboutTab.dart';
import 'package:tickety/screens/OrganizerProfileScreen/tabs/favTab.dart';
import 'package:tickety/screens/OrganizerProfileScreen/tabs/reviewsTab.dart';
import '../../core/constants/app_Colors.dart';
import '../../core/constants/imageAssets.dart';
import '../../core/localDataSource/sharedPreferencesManager.dart';
import '../EventsScreen/models/eventModel.dart';
import '../EventsScreen/models/profileHeader.dart';
import '../EventsScreen/models/reviewModel.dart';


final List<EventModel> organizerEvents = [
  EventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: 'A virtual evening of smooth jazz',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: "Jo malone london's mother's day",
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: "Women's leadership conference",
    imageBgColor: const Color(0xFFB6CFE0),
  ),
];

final List<ReviewModel> organizerReviews = [
  ReviewModel(
    avatarUrl: ImageAssets.eventDetailsImage,
    name: 'Rocks Velkeinen',
    date: '10 Feb',
    rating: 4,
    comment:
    'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
  ),
  ReviewModel(
    avatarUrl: ImageAssets.eventDetailsImage,
    name: 'Angelina Zolly',
    date: '10 Feb',
    rating: 4,
    comment:
    'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
  ),
  ReviewModel(
    avatarUrl: ImageAssets.eventDetailsImage,
    name: 'Zenifero Bolex',
    date: '10 Feb',
    rating: 4,
    comment:
    'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
  ),
];

class OrganizerProfileScreen extends StatefulWidget {
  const OrganizerProfileScreen({super.key});

  @override
  State<OrganizerProfileScreen> createState() => _OrganizerProfileScreenState();
}

class _OrganizerProfileScreenState extends State<OrganizerProfileScreen> {
  late final StoredUser? _user;
  late final List<StoredFavEvent> _favEvents;

  @override
  void initState() {
    super.initState();
    final prefs = SharedPreferencesManager.instance;
    _user      = prefs.currentUser;
    _favEvents = prefs.favEvents;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Colors.red),
          //   onPressed: () => Navigator.maybePop(context),
          // ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black87),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            ProfileHeader(
              // avatarUrl: ImageAssets.appLogo,
              // name: 'Mohamed Ali Shaltoot',
              avatarUrl: _user?.avatarUrl ?? ImageAssets.appLogo,
              name: _user?.name ?? 'Guest',
              following: 350,
              followers: 346,
              onFollowTap: () {},
              onMessageTap: () {},
            ),
            const SizedBox(height: 8),
            TabBar(
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: 'ABOUT'),
                Tab(text: 'Favourites'),
                Tab(text: 'REVIEWS'),
              ],
            ),
            const Divider(height: 1),
            Expanded(
              child: TabBarView(
                children: [
                  const AboutTab(),
                // FavTab(events: organizerEvents),
                  FavTab(
                    events: _favEvents.map((e) => EventModel(
                      imageUrl: e.imageUrl,
                      dateTime: e.dateTime,
                      title: e.title,
                      imageBgColor: Color(e.imageBgColor),
                    )).toList(),
                  ),
                  ReviewsTab(reviews: organizerReviews),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}