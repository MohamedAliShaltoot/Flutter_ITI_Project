import 'dart:ui';

import '../../../core/constants/imageAssets.dart';

class HomeEventModel {
  final String imageUrl;
  final String dateDay;
  final String dateMonth;
  final String title;
  final String? location;
  final List<String> attendeeAvatars;
  final int extraGoingCount;
  final Color imageBgColor;
  final bool isBookmarked;

  HomeEventModel({
    required this.imageUrl,
    required this.dateDay,
    required this.dateMonth,
    required this.title,
    required this.imageBgColor,
    this.location,
    this.attendeeAvatars = const [],
    this.extraGoingCount = 0,
    this.isBookmarked = false,
  });
}


