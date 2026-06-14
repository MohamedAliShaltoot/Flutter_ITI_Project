import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final int maxRating;

  const StarRating({super.key, required this.rating, this.maxRating = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxRating,
            (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 16,
        ),
      ),
    );
  }
}