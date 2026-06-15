import '../../EventsScreen/AllEventsScreen/EventsPageResult.dart';
import '../models/eventCategoryModel.dart';
import '../models/homeEventModel.dart';
import 'homeService.dart';

class HomeRepository {
  final HomeService _service;

  HomeRepository({HomeService? service}) : _service = service ?? HomeService();

  Future<List<EventCategoryModel>> getCategories() {
    return _service.fetchCategories();
  }

  Future<List<HomeEventModel>> getUpcomingEvents({
    required String city,
    int size = 10,
  }) {
    return _service.fetchEventsByCity(city: city, size: size);
  }

  Future<List<HomeEventModel>> getNearbyEvents({
    required String latlong,
    int radius = 20,
    int size = 10,
  }) {
    return _service.fetchEventsByLatLong(latlong: latlong, radius: radius, size: size);
  }

  Future<List<HomeEventModel>> searchEvents({
    String? keyword,
    String? classificationName,
    String? city,
    DateTime? startDateTime,
    DateTime? endDateTime,
    int size = 20,
  }) {
    return _service.searchEvents(
      keyword: keyword,
      classificationName: classificationName,
      city: city,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      size: size,
    );
  }

  Future<EventsPageResult> getEventsPage({
    required String city,
    int size = 20,
    int page = 0,
  }) {
    return _service.fetchEventsPageByCity(city: city, size: size, page: page);
  }
}