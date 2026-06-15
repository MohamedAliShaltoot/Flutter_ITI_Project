import 'package:dio/dio.dart';
import '../../../core/network/apiConstants.dart';
import '../../../core/network/dioClient.dart';
import '../../EventsScreen/AllEventsScreen/EventsPageResult.dart';
import '../models/eventCategoryModel.dart';
import '../models/homeEventModel.dart';

class HomeService {
  final Dio _dio = DioClient().dio;

  Future<List<EventCategoryModel>> fetchCategories() async {
    try {
      final response = await _dio.get(ApiConstants.classifications);

      final embedded = response.data['_embedded'] as Map<String, dynamic>?;
      final list = embedded?['classifications'] as List<dynamic>? ?? [];

      return list
          .map((e) => EventCategoryModel.fromJson(e as Map<String, dynamic>))
          .where((c) => c.label.isNotEmpty)
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to load categories: ${e.message}');
    }
  }

  Future<List<HomeEventModel>> fetchEventsByCity({
    required String city,
    int size = 10,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.events,
        queryParameters: {
          'city': city,
          'sort': 'date,asc',
          'size': size,
        },
      );

      return _parseEvents(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load events: ${e.message}');
    }
  }

  Future<List<HomeEventModel>> fetchEventsByLatLong({
    required String latlong,
    int radius = 20,
    int size = 10,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.events,
        queryParameters: {
          'latlong': latlong,
          'radius': radius,
          'unit': 'km',
          'sort': 'distance,asc',
          'size': size,
        },
      );

      return _parseEvents(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load nearby events: ${e.message}');
    }
  }

  Future<List<HomeEventModel>> searchEvents({
    String? keyword,
    String? classificationName,
    String? city,
    DateTime? startDateTime,
    DateTime? endDateTime,
    int size = 20,
  }) async {
    try {
      final query = <String, dynamic>{
        'size': size,
        'sort': 'date,asc',
      };

      if (keyword != null && keyword.trim().isNotEmpty) {
        query['keyword'] = keyword.trim();
      }
      if (classificationName != null && classificationName.isNotEmpty) {
        query['classificationName'] = classificationName;
      }
      if (city != null && city.isNotEmpty) {
        query['city'] = city;
      }
      if (startDateTime != null) {
        query['startDateTime'] = _toApiDateTime(startDateTime);
      }
      if (endDateTime != null) {
        query['endDateTime'] = _toApiDateTime(endDateTime);
      }

      final response = await _dio.get(
        ApiConstants.events,
        queryParameters: query,
      );

      return _parseEvents(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to search events: ${e.message}');
    }
  }

  Future<EventsPageResult> fetchEventsPageByCity({
    required String city,
    int size = 20,
    int page = 0,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.events,
        queryParameters: {
          'city': city,
          'sort': 'date,asc',
          'size': size,
          'page': page,
        },
      );

      return _parsePage(response.data, page: page);
    } on DioException catch (e) {
      throw Exception('Failed to load events: ${e.message}');
    }
  }

  EventsPageResult _parsePage(dynamic data, {required int page}) {
    final embedded = data['_embedded'] as Map<String, dynamic>?;
    final pageInfo = data['page'] as Map<String, dynamic>?;

    final totalPages = pageInfo?['totalPages'] as int? ?? 0;
    final totalElements = pageInfo?['totalElements'] as int? ?? 0;

    if (embedded == null) {
      return EventsPageResult.empty(page: page);
    }

    final list = embedded['events'] as List<dynamic>? ?? [];
    final events = list
        .map((e) => HomeEventModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return EventsPageResult(
      events: events,
      totalPages: totalPages,
      totalElements: totalElements,
      currentPage: page,
    );
  }

  String _toApiDateTime(DateTime dt) {
    final utc = dt.toUtc();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${utc.year}-${two(utc.month)}-${two(utc.day)}'
        'T${two(utc.hour)}:${two(utc.minute)}:${two(utc.second)}Z';
  }

  List<HomeEventModel> _parseEvents(dynamic data) {
    final embedded = data['_embedded'] as Map<String, dynamic>?;

    if (embedded == null) {
      final page = data['page'];
      print('No events returned. page info: $page');
      return [];
    }

    final list = embedded['events'] as List<dynamic>? ?? [];

    return list
        .map((e) => HomeEventModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<HomeEventModel>> fetchUpcomingEventsByCity({
    required String city,
    int size = 20,
    int page = 0,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.events,
        queryParameters: {
          'city': city,
          'sort': 'date,asc',
          'size': size,
          'page': page,
        },
      );
      return _parseEvents(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load upcoming events: ${e.message}');
    }
  }

  Future<List<HomeEventModel>> fetchPastEventsByCity({
    required String city,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.events,
        queryParameters: {
          'city': city,
          'endDateTime': '2026-06-15T00:00:00Z',
          'sort': 'date,desc',
          'size': size,
        },
      );
      return _parseEvents(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load past events: ${e.message}');
    }
  }

  Future<List<HomeEventModel>> fetchEventsByCategory({
    required String classificationName,
    required String city,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.events,
        queryParameters: {
          'classificationName': classificationName,
          'city': city,
          'sort': 'date,asc',
          'size': size,
        },
      );
      return _parseEvents(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load category events: ${e.message}');
    }
  }

}