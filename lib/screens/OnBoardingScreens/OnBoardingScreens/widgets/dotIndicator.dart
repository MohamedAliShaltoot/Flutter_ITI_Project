import 'package:flutter/cupertino.dart';
import '../../../../core/constants/app_Colors.dart';

class DotIndicator extends StatelessWidget {
  final int count;
  final int current;

  const DotIndicator({
    super.key,
    required this.count,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        final bool active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: active ? 7 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: active ? AppColors.dotActiveColor : AppColors.dotUnActiveColor,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}