import 'package:flutter/material.dart';
import '../../../core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';

class AppDrawerHeader extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final VoidCallback? onTap;

  const AppDrawerHeader({
    super.key,
    required this.name,
    this.avatarUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
             // backgroundColor: Colors.red,
              backgroundImage: AssetImage(ImageAssets.appLogo) as ImageProvider,
            ),
            const SizedBox(width: 14),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}