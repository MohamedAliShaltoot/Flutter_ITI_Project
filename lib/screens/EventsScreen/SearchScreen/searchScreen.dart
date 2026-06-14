import 'package:flutter/material.dart';
import '../models/eventModel.dart';
import '../widgets/eventListView.dart';
import '../widgets/reusableSearchField.dart';
import '../widgets/reusableTopBar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FB),
      body: SafeArea(
        child: Column(
          children: [
            const ScreenTopBar(title: 'Search'),
            const SizedBox(height: 8),
            const SearchInputField(),
            const SizedBox(height: 8),
            Expanded(child: EventListView(events: searchEvents)),
          ],
        ),
      ),
    );
  }
}