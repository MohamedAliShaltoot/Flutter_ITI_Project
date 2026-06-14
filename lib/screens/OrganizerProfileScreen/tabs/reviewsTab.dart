import 'package:flutter/material.dart';
import 'package:tickety/screens/EventsScreen/models/reviewCard.dart';
import '../../EventsScreen/models/reviewModel.dart';



class ReviewsTab extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewsTab({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => const Divider(height: 1, indent: 16, endIndent: 16),
      itemBuilder: (context, index) => ReviewCard(review: reviews[index]),
    );
  }
}