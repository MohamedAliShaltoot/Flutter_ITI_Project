import 'package:flutter/material.dart';

class MockupImage extends StatelessWidget {
  final String assetPath;
  final String label;

  const MockupImage({
    super.key,
    required this.assetPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}