import 'package:flutter/material.dart';
import '../models/homeEventModel.dart';
import 'eventPosterCard.dart';

// class HorizontalEventList extends StatelessWidget {
//   final List<HomeEventModel> events;
//
//   const HorizontalEventList({super.key, required this.events});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 230,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: events.length,
//         itemBuilder: (context, index) => EventPosterCard(event: events[index]),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/homeEventModel.dart';
import 'eventPosterCard.dart';

class HorizontalEventList extends StatelessWidget {
  final List<HomeEventModel> events;
  final ValueChanged<HomeEventModel>? onBookmarkTap;
  final ValueChanged<HomeEventModel>? onEventTap;

  const HorizontalEventList({
    super.key,
    required this.events,
    this.onBookmarkTap,
    this.onEventTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return EventPosterCard(
            event: event,
            onTap: () => onEventTap?.call(event),
            onBookmarkTap: () => onBookmarkTap?.call(event),
          );
        },
      ),
    );
  }
}