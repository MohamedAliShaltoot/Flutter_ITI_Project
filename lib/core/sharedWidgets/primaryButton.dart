import 'package:flutter/material.dart';
import '../constants/appSpacing.dart';
import '../constants/app_Colors.dart';
import '../constants/imageAssets.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? ratio;
  final String? imagePath;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.ratio = 0.9,
    this.imagePath=ImageAssets.leftArrowImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpacing.buttonHeight,
        width: MediaQuery.of(context).size.width  * ratio!,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(label,style: TextStyle(color: AppColors.background,fontWeight: FontWeight.w400),),
            Positioned(
              right: 16,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.arrowBGColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  imagePath!,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}