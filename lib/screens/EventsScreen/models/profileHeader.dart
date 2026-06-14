import 'package:flutter/material.dart';
import 'package:tickety/core/constants/imageAssets.dart';
import 'package:tickety/screens/EventsScreen/models/profileStat.dart';
import '../../../core/sharedWidgets/primaryButton.dart';
import '../../../core/sharedWidgets/secondaryButton.dart';

class ProfileHeader extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final int following;
  final int followers;
  final VoidCallback onFollowTap;
  final VoidCallback onMessageTap;

  const ProfileHeader({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.following,
    required this.followers,
    required this.onFollowTap,
    required this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: AssetImage(avatarUrl),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileStat(value: '$following', label: 'Following'),
            const SizedBox(width: 32),
            ProfileStat(value: '$followers', label: 'Followers'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PrimaryButton(label: 'Follow', onTap: onFollowTap,ratio: 0.4,imagePath: ImageAssets.followImage,),
            const SizedBox(width: 5),
            SecondaryButton(
              label: 'Massages',
              icon: Icons.chat_bubble_outline,
              onTap: onMessageTap,
              ratio: 0.4,
            ),
          ],
        ),
      ],
    );
  }
}