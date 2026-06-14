import 'package:flutter/material.dart';

import '../../../core/constants/imageAssets.dart';



class InviteFriendsBanner extends StatelessWidget {
  final VoidCallback onInviteTap;

  const InviteFriendsBanner({super.key, required this.onInviteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F3F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Invite your friends',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Get \$20 for ticket',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: onInviteTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ECDC4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'INVITE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(ImageAssets.inviteImage, width: 90,
              errorBuilder: (_, __, ___) => const SizedBox(width: 90, height: 80)),
        ],
      ),
    );
  }
}