import 'package:flutter/cupertino.dart';
import '../../../core/constants/imageAssets.dart';

class SocialMediaLogo extends StatelessWidget {
  const SocialMediaLogo({super.key, required this.logo});
  final String logo;

  @override
  Widget build(BuildContext context) {
    switch (logo) {
      case 'google':
        return Image.asset(
          ImageAssets.googleImage,
        );
      case 'facebook':
        return Image.asset(
          ImageAssets.facebookImage,
        );
      default:
        return Image.asset(
          ImageAssets.facebookImage,
        );
    }
  }
}