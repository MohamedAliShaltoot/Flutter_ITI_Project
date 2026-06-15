import 'package:flutter/material.dart';
import 'package:tickety/screens/EventsScreen/SearchScreen/eventListView.dart';
import '../../HomeScreen/data/homeService.dart';
import '../../HomeScreen/models/homeEventModel.dart';
import '../DetailsEventScreen/detailsEventScreen.dart';
import '../models/eventModel.dart';
import '../widgets/reusableSearchField.dart';
import '../widgets/reusableTopBar.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5FB),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const ScreenTopBar(title: 'Search'),
//             const SizedBox(height: 8),
//             const SearchInputField(),
//             const SizedBox(height: 8),
//             Expanded(child: EventListView(events: searchEvents)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

enum _SearchStatus { idle, loading, success, error }

class SearchScreen extends StatefulWidget {
  final String? initialKeyword;

  const SearchScreen({super.key, this.initialKeyword});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final HomeService _service = HomeService();
  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;
  _SearchStatus _status = _SearchStatus.idle;
  List<HomeEventModel> _results = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.initialKeyword != null && widget.initialKeyword!.isNotEmpty) {
      _controller.text = widget.initialKeyword!;
      _search(widget.initialKeyword!);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();

    if (value.trim().isEmpty) {
      setState(() {
        _status = _SearchStatus.idle;
        _results = [];
      });
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _search(value);
    });
  }

  Future<void> _search(String keyword) async {
    setState(() => _status = _SearchStatus.loading);
    try {
      final results = await _service.searchEvents(keyword: keyword, size: 20);
      setState(() {
        _results = results;
        _status = _SearchStatus.success;
      });
    } catch (e) {
      setState(() {
        _status = _SearchStatus.error;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FB),
      body: SafeArea(
        child: Column(
          children: [
            const ScreenTopBar(title: 'Search'),
            const SizedBox(height: 8),
            SearchInputField(
              controller: _controller,
              onChanged: _onChanged,
              onSubmitted: _search,
              onFilterTap: () {

              },
            ),
            const SizedBox(height: 8),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_status) {
      case _SearchStatus.idle:
        return const Center(
          child: Text(
            'Search for events by name, artist, or venue',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        );
      case _SearchStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case _SearchStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _errorMessage ?? 'Something went wrong',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => _search(_controller.text),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      case _SearchStatus.success:
        if (_results.isEmpty) {
          return const Center(
            child: Text('No events found', style: TextStyle(color: Colors.grey)),
          );
        }
        return EventListView(
          events: _results,
          onEventTap: (event) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EventDetailsScreen(event: event),
              ),
            );
          },
        );
    }
  }
}