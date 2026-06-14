import 'package:flutter/material.dart';
import '../../../core/constants/imageAssets.dart';
import '../widgets/reusableEventCard.dart';


class EventModel {
  final String imageUrl;
  final String dateTime;
  final String title;
  final String? location;
  final Color imageBgColor;

  EventModel({
    required this.imageUrl,
    required this.dateTime,
    required this.title,
    required this.imageBgColor,
    this.location,
  });
}


final List<EventModel> searchEvents = [
  EventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: 'A virtual evening of smooth jazz',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: "Jo malone london's mother's day",
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: 'A virtual evening of smooth jazz',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: "Jo malone london's mother's day",
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: 'A virtual evening of smooth jazz',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: "Jo malone london's mother's day",
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl: ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: 'A virtual evening of smooth jazz',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: '1ST MAY - SAT - 2:00 PM',
    title: "Jo malone london's mother's day",
    imageBgColor: const Color(0xFFF6D9D2),
  ),

];

final List<EventModel> allEvents = [
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Wed, Apr 28 · 5:30 PM',
    title: "Jo Malone London's Mother's Day Presents",
    location: 'Radius Gallery · Santa Cruz, CA',
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Sat, May 1 · 2:00 PM',
    title: 'A Virtual Evening of Smooth Jazz',
    location: 'Lot 13 · Oakland, CA',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Wed, Apr 28 · 5:30 PM',
    title: "Jo Malone London's Mother's Day Presents",
    location: 'Radius Gallery · Santa Cruz, CA',
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Sat, May 1 · 2:00 PM',
    title: 'A Virtual Evening of Smooth Jazz',
    location: 'Lot 13 · Oakland, CA',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Wed, Apr 28 · 5:30 PM',
    title: "Jo Malone London's Mother's Day Presents",
    location: 'Radius Gallery · Santa Cruz, CA',
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Sat, May 1 · 2:00 PM',
    title: 'A Virtual Evening of Smooth Jazz',
    location: 'Lot 13 · Oakland, CA',
    imageBgColor: const Color(0xFF2D2A6E),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Wed, Apr 28 · 5:30 PM',
    title: "Jo Malone London's Mother's Day Presents",
    location: 'Radius Gallery · Santa Cruz, CA',
    imageBgColor: const Color(0xFFF6D9D2),
  ),
  EventModel(
    imageUrl:  ImageAssets.eventDetailsImage,
    dateTime: 'Sat, May 1 · 2:00 PM',
    title: 'A Virtual Evening of Smooth Jazz',
    location: 'Lot 13 · Oakland, CA',
    imageBgColor: const Color(0xFF2D2A6E),
  ),

];







