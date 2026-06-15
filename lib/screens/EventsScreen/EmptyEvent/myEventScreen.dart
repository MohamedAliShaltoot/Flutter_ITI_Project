import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../core/constants/imageAssets.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/sharedWidgets/primaryButton.dart';
import '../../HomeScreen/data/repository.dart';
import '../../HomeScreen/models/homeEventModel.dart';

enum _LoadStatus { loading, success, error }

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({super.key});

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  final HomeRepository _repo = HomeRepository();
  static const String _city = 'New York';

  _LoadStatus _upcomingStatus = _LoadStatus.loading;
  _LoadStatus _pastStatus    = _LoadStatus.loading;

  List<HomeEventModel> _upcomingEvents = [];
  List<HomeEventModel> _pastEvents     = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadUpcoming();
    _loadPast();
  }

  Future<void> _loadUpcoming() async {
    setState(() => _upcomingStatus = _LoadStatus.loading);
    try {
      final result = await _repo.getMyUpcomingEvents(city: _city);
      setState(() { _upcomingEvents = result; _upcomingStatus = _LoadStatus.success; });
    } catch (e) {
      setState(() { _upcomingStatus = _LoadStatus.error; _errorMessage = e.toString(); });
    }
  }

  Future<void> _loadPast() async {
    setState(() => _pastStatus = _LoadStatus.loading);
    try {
      final result = await _repo.getMyPastEvents(city: _city);
      setState(() { _pastEvents = result; _pastStatus = _LoadStatus.success; });
    } catch (e) {
      setState(() { _pastStatus = _LoadStatus.error; _errorMessage = e.toString(); });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.appBGColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.appBGColor,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Events',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 9, offset: const Offset(0, 2)),
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.grayColor,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                  dividerColor: Colors.transparent,
                  tabs: const [Tab(text: 'UPCOMING'), Tab(text: 'PAST EVENTS')],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _EventsBody(
              status: _upcomingStatus,
              events: _upcomingEvents,
              errorMessage: _errorMessage,
              onRetry: _loadUpcoming,
            ),
            _EventsBody(
              status: _pastStatus,
              events: _pastEvents,
              errorMessage: _errorMessage,
              onRetry: _loadPast,
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: PrimaryButton(
              label: 'EXPLORE EVENTS',
              onTap: () => Navigator.pushNamed(context, AppRoutes.allEventsScreen),
            ),
          ),
        ),
      ),
    );
  }
}

class _EventsBody extends StatelessWidget {
  final _LoadStatus status;
  final List<HomeEventModel> events;
  final String? errorMessage;
  final VoidCallback onRetry;

  const _EventsBody({
    required this.status,
    required this.events,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _LoadStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case _LoadStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMessage ?? 'Something went wrong',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 12),
              TextButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ),
        );

      case _LoadStatus.success:
        if (events.isEmpty) return const _EmptyState();
        return RefreshIndicator(
          onRefresh: () async => onRetry(),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: events.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, i) => MyEventCard(event: events[i]),
          ),
        );
    }
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageAssets.noUpComingEventsImage, width: 180, height: 180),
          const SizedBox(height: 24),
          const Text(
            'No Events Found',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text(
            'There are no events to show here yet.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
          ),
        ],
      ),
    );
  }
}



class MyEventCard extends StatelessWidget {
  final HomeEventModel event;
  const MyEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: event.imageUrl.isNotEmpty
                ? Image.network(
              event.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _fallback(event.imageBgColor),
            )
                : _fallback(event.imageBgColor),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    '${event.dateDay} ${event.dateMonth} ${event.dateYear}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 6),

                  if (event.localTime.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 12, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          event.localTime,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                  if (event.localTime.isNotEmpty) const SizedBox(height: 4),

                  if (event.location != null)
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 12, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            event.location!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.chevron_right, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _fallback(Color bgColor) => Container(
    width: 100,
    height: 100,
    color: bgColor,
    child: const Icon(Icons.event, color: Colors.white),
  );
}