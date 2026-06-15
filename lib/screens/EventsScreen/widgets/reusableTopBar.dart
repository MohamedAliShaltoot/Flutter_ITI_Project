import 'package:flutter/material.dart';

class ScreenTopBar extends StatelessWidget {
  final String title;
  final Color? color;
  final List<Widget>? actions;

  const ScreenTopBar({super.key, required this.title, this.actions, this.color = const Color(0xFF1A1A2E)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      child: Row(
        children: [
          IconButton(
            icon:  Icon(Icons.arrow_back, color: color),
            onPressed: () => Navigator.maybePop(context),
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}