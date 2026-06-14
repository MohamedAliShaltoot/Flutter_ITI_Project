import 'package:flutter/material.dart';

import '../models/eventCategoryModel.dart';
import 'categoryChip.dart';

class CategoryChipsRow extends StatelessWidget {
  final List<EventCategoryModel> categories;
  final ValueChanged<EventCategoryModel>? onCategoryTap;

  const CategoryChipsRow({super.key, required this.categories, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryChip(
            category: category,
            onTap: () => onCategoryTap?.call(category),
          );
        },
      ),
    );
  }
}