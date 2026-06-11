import 'package:flutter/cupertino.dart';

import '../../../core/constants/app_Colors.dart';

class AuthFooterRow extends StatelessWidget {
  final String baseText;
  final String linkText;
  final VoidCallback onLinkTap;

  const AuthFooterRow({
    super.key,
    required this.baseText,
    required this.linkText,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(baseText),
        GestureDetector(
          onTap: onLinkTap,
          child: Text(' $linkText',style: TextStyle(color: AppColors.linkColor,fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}