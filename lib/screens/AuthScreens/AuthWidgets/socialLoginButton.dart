import 'package:flutter/material.dart';
import '../../../core/constants/appSpacing.dart';
import '../../../core/constants/app_Colors.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget logo;
  final String label;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.logo,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpacing.fieldHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
          border: Border.all(color: AppColors.fieldBorder, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 22, height: 22, child: logo),
            const SizedBox(width: 12),
            Text(label),
          ],
        ),
      ),
    );
  }
}