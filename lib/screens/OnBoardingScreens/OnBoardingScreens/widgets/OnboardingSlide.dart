import 'package:flutter/material.dart';
import 'package:tickety/screens/OnBoardingScreens/OnBoardingScreens/widgets/phoneImages.dart';
import '../../../../core/constants/app_Colors.dart';
import 'OnboardingData.dart';
import 'nnboardingNavRow.dart';

class OnboardingSlide extends StatelessWidget {
  final OnboardingData data;
  final int currentPage;
  final int totalPages;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingSlide({
    super.key,
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.onSkip,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          SizedBox(height: 32),
          PhoneImages(borderColor: data.borderColor, child: data.phoneMockup),
          Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            padding: const EdgeInsets.fromLTRB(28, 32, 28, 20),
            child: Column(
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.background,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.background),
                ),
                const SizedBox(height: 28),
                OnboardingNavRow(
                  currentPage: currentPage,
                  totalPages: totalPages,
                  onSkip: onSkip,
                  onNext: onNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
