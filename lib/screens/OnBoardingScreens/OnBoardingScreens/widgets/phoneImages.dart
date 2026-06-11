import 'package:flutter/cupertino.dart';
import '../../../../core/constants/app_Colors.dart';

class PhoneImages extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const PhoneImages({
    super.key,
    required this.child,
    this.borderColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 530,
      decoration: BoxDecoration(
        color: AppColors.background,
      ),
      child: child,
    );
  }
}