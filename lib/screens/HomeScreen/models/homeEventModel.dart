import 'dart:ui';

import '../../../core/constants/imageAssets.dart';

// class HomeEventModel {
//   final String imageUrl;
//   final String dateDay;
//   final String dateMonth;
//   final String title;
//   final String? location;
//   final List<String> attendeeAvatars;
//   final int extraGoingCount;
//   final Color imageBgColor;
//   final bool isBookmarked;
//
//   HomeEventModel({
//     required this.imageUrl,
//     required this.dateDay,
//     required this.dateMonth,
//     required this.title,
//     required this.imageBgColor,
//     this.location,
//     this.attendeeAvatars = const [],
//     this.extraGoingCount = 0,
//     this.isBookmarked = false,
//   });
// }

import 'package:flutter/material.dart';

// class HomeEventModel {
//   final String id;
//   final String imageUrl;
//   final String dateDay;
//   final String dateMonth;
//   final String title;
//   final String? location;
//   final List<String> attendeeAvatars;
//   final int extraGoingCount;
//   final Color imageBgColor;
//   final bool isBookmarked;
//
//   HomeEventModel({
//     required this.id,
//     required this.imageUrl,
//     required this.dateDay,
//     required this.dateMonth,
//     required this.title,
//     required this.imageBgColor,
//     this.location,
//     this.attendeeAvatars = const [],
//     this.extraGoingCount = 0,
//     this.isBookmarked = false,
//   });
//
//   factory HomeEventModel.fromJson(Map<String, dynamic> json) {
//     final id = json['id'] as String? ?? '';
//     final title = json['name'] as String? ?? 'Untitled Event';
//
//     // ---- date ----
//     final dates = json['dates'] as Map<String, dynamic>?;
//     final start = dates?['start'] as Map<String, dynamic>?;
//     final localDate = start?['localDate'] as String?; // e.g. "2025-06-10"
//
//     String dateDay = '--';
//     String dateMonth = '---';
//     if (localDate != null) {
//       final parsed = DateTime.tryParse(localDate);
//       if (parsed != null) {
//         dateDay = parsed.day.toString().padLeft(2, '0');
//         dateMonth = _monthAbbrev(parsed.month);
//       }
//     }
//
//     // ---- image ----
//     final images = json['images'] as List<dynamic>?;
//     String imageUrl = '';
//     if (images != null && images.isNotEmpty) {
//       // Prefer a wider image if available, fallback to first.
//       final wide = images.firstWhere(
//             (img) => (img['width'] as int? ?? 0) >= 500,
//         orElse: () => images.first,
//       );
//       imageUrl = wide['url'] as String? ?? '';
//     }
//
//     // ---- venue / location ----
//     final embedded = json['_embedded'] as Map<String, dynamic>?;
//     final venues = embedded?['venues'] as List<dynamic>?;
//     String? location;
//     if (venues != null && venues.isNotEmpty) {
//       final venue = venues.first as Map<String, dynamic>;
//       final venueName = venue['name'] as String?;
//       final city = (venue['city'] as Map<String, dynamic>?)?['name'] as String?;
//       final country =
//       (venue['country'] as Map<String, dynamic>?)?['name'] as String?;
//
//       final parts = [venueName, city, country]
//           .where((e) => e != null && e.isNotEmpty)
//           .toList();
//       location = parts.isNotEmpty ? parts.join(', ') : null;
//     }
//
//     return HomeEventModel(
//       id: id,
//       imageUrl: imageUrl,
//       dateDay: dateDay,
//       dateMonth: dateMonth,
//       title: title,
//       location: location,
//       imageBgColor: const Color(0xFFFBD8C9), // local UI accent, API doesn't provide this
//       attendeeAvatars: const [], // not provided by Ticketmaster
//       extraGoingCount: 0, // not provided by Ticketmaster
//       isBookmarked: false, // local user state, set after fetch / from local storage
//     );
//   }
//
//   static String _monthAbbrev(int month) {
//     const months = [
//       'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
//       'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
//     ];
//     return months[(month - 1).clamp(0, 11)];
//   }
//
//   HomeEventModel copyWith({bool? isBookmarked}) {
//     return HomeEventModel(
//       id: id,
//       imageUrl: imageUrl,
//       dateDay: dateDay,
//       dateMonth: dateMonth,
//       title: title,
//       location: location,
//       attendeeAvatars: attendeeAvatars,
//       extraGoingCount: extraGoingCount,
//       imageBgColor: imageBgColor,
//       isBookmarked: isBookmarked ?? this.isBookmarked,
//     );
//   }
// }
import 'package:flutter/material.dart';

class HomeEventModel {
  final String id;
  final String imageUrl;
  final String dateDay;
  final String dateMonth;
  final String dateYear;
  final String localTime;
  final String title;
  final String? location;
  final String? description;
  final List<String> attendeeAvatars;
  final int extraGoingCount;
  final Color imageBgColor;
  final bool isBookmarked;

  HomeEventModel({
    required this.id,
    required this.imageUrl,
    required this.dateDay,
    required this.dateMonth,
    required this.title,
    required this.imageBgColor,
    this.dateYear = '',
    this.localTime = '',
    this.location,
    this.description,
    this.attendeeAvatars = const [],
    this.extraGoingCount = 0,
    this.isBookmarked = false,
  });

  factory HomeEventModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String? ?? '';
    final title = json['name'] as String? ?? 'Untitled Event';

    final dates = json['dates'] as Map<String, dynamic>?;
    final start = dates?['start'] as Map<String, dynamic>?;
    final localDate = start?['localDate'] as String?;

    String dateDay = '--';
    String dateMonth = '---';
    String dateYear = '';
    String localTime = '';
    if (localDate != null) {
      final parsed = DateTime.tryParse(localDate);
      if (parsed != null) {
        dateDay = parsed.day.toString().padLeft(2, '0');
        dateMonth = _monthAbbrev(parsed.month);
        dateYear = parsed.year.toString();
      }
    }
    final rawLocalTime = start?['localTime'] as String?;
    if (rawLocalTime != null && rawLocalTime.length >= 5) {
      localTime = rawLocalTime.substring(0, 5);
    }

    final description = json['info'] as String? ?? json['pleaseNote'] as String?;

    final images = json['images'] as List<dynamic>?;
    String imageUrl = '';
    if (images != null && images.isNotEmpty) {
      final wide = images.firstWhere(
            (img) => (img['width'] as int? ?? 0) >= 500,
        orElse: () => images.first,
      );
      imageUrl = wide['url'] as String? ?? '';
    }

    final embedded = json['_embedded'] as Map<String, dynamic>?;
    final venues = embedded?['venues'] as List<dynamic>?;
    String? location;
    if (venues != null && venues.isNotEmpty) {
      final venue = venues.first as Map<String, dynamic>;
      final venueName = venue['name'] as String?;
      final city = (venue['city'] as Map<String, dynamic>?)?['name'] as String?;
      final country =
      (venue['country'] as Map<String, dynamic>?)?['name'] as String?;

      final parts = [venueName, city, country]
          .where((e) => e != null && e.isNotEmpty)
          .toList();
      location = parts.isNotEmpty ? parts.join(', ') : null;
    }

    return HomeEventModel(
      id: id,
      imageUrl: imageUrl,
      dateDay: dateDay,
      dateMonth: dateMonth,
      dateYear: dateYear,
      localTime: localTime,
      title: title,
      location: location,
      description: description,
      imageBgColor: const Color(0xFFFBD8C9),
      attendeeAvatars: const [],
      extraGoingCount: 0,
      isBookmarked: false,
    );
  }

  static String _monthAbbrev(int month) {
    const months = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
    ];
    return months[(month - 1).clamp(0, 11)];
  }

  HomeEventModel copyWith({bool? isBookmarked}) {
    return HomeEventModel(
      id: id,
      imageUrl: imageUrl,
      dateDay: dateDay,
      dateMonth: dateMonth,
      dateYear: dateYear,
      localTime: localTime,
      title: title,
      location: location,
      description: description,
      attendeeAvatars: attendeeAvatars,
      extraGoingCount: extraGoingCount,
      imageBgColor: imageBgColor,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
