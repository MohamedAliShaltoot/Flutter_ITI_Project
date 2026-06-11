import 'package:flutter/material.dart';
import 'package:tickety/core/constants/app_Colors.dart';

class InfoRow extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String title;
  final String subtitle;

  const InfoRow({super.key,
    required this.iconPath,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Icon box
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child:Image.asset(iconPath, color: iconColor),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.grayColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}