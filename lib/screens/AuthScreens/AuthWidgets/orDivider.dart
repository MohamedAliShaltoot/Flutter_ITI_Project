import 'package:flutter/material.dart';
import '../../../core/constants/app_Colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Expanded(
        //   child: Divider(color: AppColors.fieldBorder, thickness: 1),
        // ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR',
            style: TextStyle(
              color: AppColors.grayColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        // Expanded(
        //   child: Divider(color: AppColors.fieldBorder, thickness: 1),
        // ),
      ],
    );
  }
}
