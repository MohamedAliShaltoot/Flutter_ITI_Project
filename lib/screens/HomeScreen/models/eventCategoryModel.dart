import 'package:flutter/material.dart';

class EventCategoryModel {
  final String id;
  final String label;
  final IconData icon;
  final Color color;

  EventCategoryModel({
    required this.id,
    required this.label,
    required this.icon,
    required this.color,
  });

  factory EventCategoryModel.fromJson(Map<String, dynamic> json) {
    final segment = json['segment'] as Map<String, dynamic>?;
    final name = segment?['name'] as String? ?? 'Other';
    final id = segment?['id'] as String? ?? name;

    return EventCategoryModel(
      id: id,
      label: name,
      icon: _iconForCategory(name),
      color: _colorForCategory(name),
    );
  }

  static IconData _iconForCategory(String name) {
    switch (name.toLowerCase()) {
      case 'sports':
        return Icons.sports_soccer;
      case 'music':
        return Icons.music_note;
      case 'arts & theatre':
      case 'arts':
        return Icons.palette;
      case 'film':
        return Icons.movie;
      case 'miscellaneous':
        return Icons.restaurant;
      default:
        return Icons.category;
    }
  }

  static Color _colorForCategory(String name) {
    switch (name.toLowerCase()) {
      case 'sports':
        return const Color(0xFFFF6B6B);
      case 'music':
        return const Color(0xFFFFA552);
      case 'arts & theatre':
      case 'arts':
        return const Color(0xFF6C63FF);
      case 'film':
        return const Color(0xFF4ECDC4);
      default:
        return const Color(0xFF4ECDC4);
    }
  }
}

