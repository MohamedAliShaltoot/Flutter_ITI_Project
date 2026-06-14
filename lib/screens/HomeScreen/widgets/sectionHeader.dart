import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllTap;

  const SectionHeader({super.key, required this.title, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          GestureDetector(
            onTap: onSeeAllTap,
            child: Row(
              children: [
                const Text(
                  'See All',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(width: 2),
                Icon(Icons.chevron_right, size: 16, color: Colors.grey.shade500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}