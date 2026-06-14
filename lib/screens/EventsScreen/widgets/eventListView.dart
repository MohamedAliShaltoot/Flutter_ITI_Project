import 'package:flutter/material.dart';
import 'package:tickety/screens/EventsScreen/widgets/reusableEventCard.dart';

import '../models/eventModel.dart';

class EventListView extends StatelessWidget {
  final List<EventModel> events;

  const EventListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}