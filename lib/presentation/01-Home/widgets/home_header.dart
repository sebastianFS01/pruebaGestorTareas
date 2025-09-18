import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String titleApp;
  final String totalPoints;
  final double progress;

  const HomeHeader({
    super.key,
    required this.titleApp,
    required this.totalPoints,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleApp,
          style: const TextStyle(
            color: Color(0xFF2D3142),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              totalPoints,
              style: const TextStyle(
                color: Color(0xFF4F8A8B),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 12,
                  backgroundColor: const Color(0xFFE0E5EC),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF4F8A8B),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
