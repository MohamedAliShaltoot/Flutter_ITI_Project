import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/appConstants.dart';
import '../../../../core/constants/app_Colors.dart';
import 'dotIndicator.dart';

class OnboardingNavRow extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingNavRow({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onSkip,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: Text(AppConstants.skipButton,style: TextStyle(color: AppColors.appBGColor), ),
        ),
        DotIndicator(count: totalPages, current: currentPage),
        TextButton(
          onPressed: onNext,
          child: Text(AppConstants.nextButton,style: TextStyle(color: AppColors.appBGColor) ),
        ),
      ],
    );
  }
}