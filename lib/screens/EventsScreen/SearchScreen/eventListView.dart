import 'package:flutter/material.dart';
import '../../HomeScreen/models/homeEventModel.dart';
import '../../HomeScreen/widgets/eventCard.dart';


class EventListView extends StatelessWidget {
  final List<HomeEventModel> events;
  final ValueChanged<HomeEventModel>? onEventTap;

  const EventListView({super.key, required this.events, this.onEventTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventCard(
          event: event,
          onTap: () => onEventTap?.call(event),
        );
      },
    );
  }
}