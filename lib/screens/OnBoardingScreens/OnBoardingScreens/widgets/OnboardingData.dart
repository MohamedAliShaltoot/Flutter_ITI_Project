import 'package:flutter/material.dart';


class OnboardingData {
  final String title;
  final String subtitle;
  final Widget phoneMockup;
  final Color borderColor;

  const OnboardingData({
    required this.title,
    required this.subtitle,
    required this.phoneMockup,
    required this.borderColor,
  });
}