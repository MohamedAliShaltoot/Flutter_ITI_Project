import '../../HomeScreen/models/homeEventModel.dart';

class EventsPageResult {
  final List<HomeEventModel> events;
  final int totalPages;
  final int totalElements;
  final int currentPage;

  EventsPageResult({
    required this.events,
    required this.totalPages,
    required this.totalElements,
    required this.currentPage,
  });

  bool get hasMore => currentPage + 1 < totalPages;

  factory EventsPageResult.empty({int page = 0}) => EventsPageResult(
    events: const [],
    totalPages: 0,
    totalElements: 0,
    currentPage: page,
  );
}