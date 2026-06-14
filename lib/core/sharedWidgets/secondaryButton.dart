import 'package:flutter/material.dart';
import '../constants/appSpacing.dart';
import '../constants/app_Colors.dart';
import '../constants/imageAssets.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final double? ratio;
  final String? imagePath;
  const SecondaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.ratio = 0.9,
    this.imagePath=ImageAssets.chatImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpacing.buttonHeight,
        width: MediaQuery.of(context).size.width * ratio!,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
          imagePath!,
        ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}