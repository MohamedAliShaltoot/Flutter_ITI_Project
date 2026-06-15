import 'package:flutter/material.dart';
import 'package:tickety/screens/HomeScreen/widgets/appDrawer.dart';
import 'package:tickety/screens/HomeScreen/widgets/categoryChipsRow.dart';
import 'package:tickety/screens/HomeScreen/widgets/homeHeader.dart';
import 'package:tickety/screens/HomeScreen/widgets/horizontalEventList.dart';
import 'package:tickety/screens/HomeScreen/widgets/inlineError.dart';
import 'package:tickety/screens/HomeScreen/widgets/inviteFriendsBanner.dart';
import 'package:tickety/screens/HomeScreen/widgets/sectionHeader.dart';
import '../../core/constants/app_Colors.dart';
import '../../core/routes/app_routes.dart';
import '../EventsScreen/SearchScreen/searchScreen.dart';
import '../EventsScreen/widgets/reusableSearchField.dart';
import 'data/repository.dart';
import 'models/eventCategoryModel.dart';
import 'models/homeEventModel.dart';


enum _LoadStatus { loading, success, error }

class HomeTabBody extends StatefulWidget {
  const HomeTabBody({super.key});

  @override
  State<HomeTabBody> createState() => _HomeTabBodyState();
}

class _HomeTabBodyState extends State<HomeTabBody> {
  final HomeRepository _appRepository = HomeRepository();

  _LoadStatus _categoriesStatus = _LoadStatus.loading;
  _LoadStatus _upcomingStatus = _LoadStatus.loading;
  _LoadStatus _nearbyStatus = _LoadStatus.loading;

  List<EventCategoryModel> _categories = [];
  List<HomeEventModel> _upcomingEvents = [];
  List<HomeEventModel> _nearbyEvents = [];

  String? _errorMessage;

  static const String _city = 'New York';
  static const String _latlong = '40.7128,-74.0060';

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _loadUpcoming();
    _loadNearby();
  }

  Future<void> _loadCategories() async {
    setState(() => _categoriesStatus = _LoadStatus.loading);
    try {
      final result = await _appRepository.getCategories();
      setState(() {
        _categories = result;
        _categoriesStatus = _LoadStatus.success;
      });
    } catch (e) {
      setState(() {
        _categoriesStatus = _LoadStatus.error;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _loadUpcoming() async {
    setState(() => _upcomingStatus = _LoadStatus.loading);
    try {
      final result = await _appRepository.getUpcomingEvents(city: _city);
      setState(() {
        _upcomingEvents = result;
        _upcomingStatus = _LoadStatus.success;
      });
    } catch (e) {
      setState(() {
        _upcomingStatus = _LoadStatus.error;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _loadNearby() async {
    setState(() => _nearbyStatus = _LoadStatus.loading);
    try {
      final result = await _appRepository.getNearbyEvents(latlong: _latlong);
      setState(() {
        _nearbyEvents = result;
        _nearbyStatus = _LoadStatus.success;
      });
    } catch (e) {
      setState(() {
        _nearbyStatus = _LoadStatus.error;
        _errorMessage = e.toString();
      });
    }
  }

  void _toggleBookmark(String eventId, {required bool isUpcomingList}) {
    setState(() {
      final list = isUpcomingList ? _upcomingEvents : _nearbyEvents;
      final index = list.indexWhere((e) => e.id == eventId);
      if (index == -1) return;
      list[index] = list[index].copyWith(isBookmarked: !list[index].isBookmarked);
    });
  }

  Future<void> _onRefresh() async {
    await Future.wait([_loadCategories(), _loadUpcoming(), _loadNearby()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(
        userName: 'Mohamed Ali Shaltoot',
        userEmail: 'mohamed.shaltoot@example.com',
      ),
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                      Builder(
                        builder: (context) => HomeHeader(
                          location: '$_city, USA',
                          onMenuTap: () => Scaffold.of(context).openDrawer(),
                          onNotificationTap: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      SearchInputField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SearchScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildCategoriesSection(),

                const SizedBox(height: 20),
                SectionHeader(title: 'Upcoming Events', onSeeAllTap: () {
                  Navigator.pushNamed(context, AppRoutes.allEventsScreen);
                }),
                const SizedBox(height: 12),
                _buildEventsSection(
                  status: _upcomingStatus,
                  events: _upcomingEvents,
                  isUpcomingList: true,
                  onRetry: _loadUpcoming,
                ),

                const SizedBox(height: 20),
                InviteFriendsBanner(onInviteTap: () {}),
                const SizedBox(height: 20),
                SectionHeader(title: 'Nearby You', onSeeAllTap: () {}),
                const SizedBox(height: 12),

                _buildEventsSection(
                  status: _nearbyStatus,
                  events: _nearbyEvents,
                  isUpcomingList: false,
                  onRetry: _loadNearby,
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    switch (_categoriesStatus) {
      case _LoadStatus.loading:
        return const SizedBox(
          height: 40,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryColor,)),
        );
      case _LoadStatus.error:
        return InlineError(
          message: 'Failed to load categories',
          onRetry: _loadCategories,
        );
      case _LoadStatus.success:
        return CategoryChipsRow(
          categories: _categories,
          onCategoryTap: (c) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchScreen(initialCategory: c.label),
              ),
            );
          },
        );
    }
  }

  Widget _buildEventsSection({
    required _LoadStatus status,
    required List<HomeEventModel> events,
    required bool isUpcomingList,
    required VoidCallback onRetry,
  }) {
    switch (status) {
      case _LoadStatus.loading:
        return const SizedBox(
          height: 230,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryColor,)),
        );
      case _LoadStatus.error:
        return SizedBox(
          height: 230,
          child: InlineError(
            message: _errorMessage ?? 'Something went wrong',
            onRetry: onRetry,
          ),
        );
      case _LoadStatus.success:
        if (events.isEmpty) {
          return const SizedBox(
            height: 230,
            child: Center(child: Text('No events found')),
          );
        }
        return HorizontalEventList(
          events: events,
          onBookmarkTap: (event) => _toggleBookmark(event.id, isUpcomingList: isUpcomingList),
        );
    }
  }
}