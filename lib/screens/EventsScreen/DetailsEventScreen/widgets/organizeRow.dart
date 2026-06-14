import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_Colors.dart';
import '../../../../core/constants/imageAssets.dart';
import '../../../../core/routes/app_routes.dart';

class OrganizerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage(ImageAssets.appLogo),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.grey.shade200),
            ),
          ),
          const SizedBox(width: 14),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Ali',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Organizer',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          // Follow button
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.organizerProfileScreen);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xffebedff) ,
              side: const BorderSide(color: AppColors.whiteColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            ),
            child: const Text(
              'Follow',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}