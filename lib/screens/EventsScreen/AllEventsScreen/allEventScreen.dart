import 'package:flutter/material.dart';
import 'package:tickety/core/constants/app_Colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../HomeScreen/data/homeService.dart';
import '../../HomeScreen/widgets/eventCard.dart';
import '../DetailsEventScreen/detailsEventScreen.dart';
import '../models/eventModel.dart';
import '../widgets/eventListView.dart';
import '../widgets/reusableTopBar.dart';

// class AllEventsScreen extends StatelessWidget {
//   const AllEventsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5FB),
//       body: SafeArea(
//         child: Column(
//           children: [
//             ScreenTopBar(
//               title: 'Events',
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.search, color: Color(0xFF1A1A2E)),
//                   onPressed: () {
//                     Navigator.pushNamed(context, AppRoutes.searchScreen);
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.more_vert, color: Color(0xFF1A1A2E)),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             Expanded(child: EventListView(events: allEvents)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import '../../HomeScreen/models/homeEventModel.dart';

import '../SearchScreen/searchScreen.dart';

import 'EventsPageResult.dart';

enum _LoadStatus { loading, success, error }

class AllEventsScreen extends StatefulWidget {
  const AllEventsScreen({super.key});

  @override
  State<AllEventsScreen> createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  final HomeService _service = HomeService();
  final ScrollController _scrollController = ScrollController();
  static const String _city = 'New York';

  _LoadStatus _status = _LoadStatus.loading;
  String? _errorMessage;

  final List<HomeEventModel> _events = [];
  int _page = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _loadFirstPage();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_hasMore || _isLoadingMore) return;

    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadFirstPage() async {
    setState(() {
      _status = _LoadStatus.loading;
      _page = 0;
      _hasMore = true;
      _events.clear();
    });

    try {
      final EventsPageResult result = await _service.fetchEventsPageByCity(
        city: _city,
        page: 0,
      );
      setState(() {
        _events.addAll(result.events);
        _hasMore = result.hasMore;
        _status = _LoadStatus.success;
      });
    } catch (e) {
      setState(() {
        _status = _LoadStatus.error;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);

    final nextPage = _page + 1;
    try {
      final EventsPageResult result = await _service.fetchEventsPageByCity(
        city: _city,
        page: nextPage,
      );
      setState(() {
        _events.addAll(result.events);
        _page = nextPage;
        _hasMore = result.hasMore;
      });
    } catch (e) {
      print('Failed to load more events: $e');
    } finally {
      setState(() => _isLoadingMore = false);
    }
  }

  void _onEventTap(HomeEventModel event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EventDetailsScreen(event: event),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FB),
      body: SafeArea(
        child: Column(
          children: [
            ScreenTopBar(
              color:  Colors.black,
              title: 'Events',
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: Color(0xFF1A1A2E)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SearchScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Color(0xFF1A1A2E)),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_status) {
      case _LoadStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case _LoadStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  _errorMessage ?? 'Something went wrong',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(onPressed: _loadFirstPage, child: const Text('Retry')),
            ],
          ),
        );
      case _LoadStatus.success:
        if (_events.isEmpty) {
          return const Center(
            child: Text('No events found', style: TextStyle(color: Colors.grey)),
          );
        }
        return RefreshIndicator(
          onRefresh: _loadFirstPage,
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            itemCount: _events.length + (_hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= _events.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return EventCard(
                event: _events[index],
                onTap: () => _onEventTap(_events[index]),
              );
            },
          ),
        );
    }
  }
}