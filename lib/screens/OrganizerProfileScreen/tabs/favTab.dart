import 'package:flutter/material.dart';
import '../../EventsScreen/models/eventModel.dart';
import '../../EventsScreen/widgets/reusableEventCard.dart';

class FavTab extends StatelessWidget {
  final List<EventModel> events;

  const FavTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}