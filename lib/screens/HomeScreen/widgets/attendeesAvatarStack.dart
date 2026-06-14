import 'package:flutter/material.dart';
import 'package:tickety/screens/HomeScreen/widgets/categoryChipsRow.dart';
import 'package:tickety/screens/HomeScreen/widgets/homeHeader.dart';
import 'package:tickety/screens/HomeScreen/widgets/horizontalEventList.dart';
import 'package:tickety/screens/HomeScreen/widgets/inviteFriendsBanner.dart';
import 'package:tickety/screens/HomeScreen/widgets/sectionHeader.dart';

import '../../../core/constants/app_Colors.dart';



class AttendeesAvatarStack extends StatelessWidget {
  final List<String> avatarUrls;
  final int extraCount;

  const AttendeesAvatarStack({
    super.key,
    required this.avatarUrls,
    this.extraCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: avatarUrls.length * 18.0 + 14,
          height: 26,
          child: Stack(
            children: List.generate(avatarUrls.length, (index) {
              return Positioned(
                left: index * 18.0,
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: AssetImage(avatarUrls[index]),
                  ),
                ),
              );
            }),
          ),
        ),
        if (extraCount > 0)
          Text(
            '+$extraCount Going',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
      ],
    );
  }
}