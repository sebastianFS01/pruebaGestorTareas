import 'package:flutter/material.dart';

class HomeAddTaskButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const HomeAddTaskButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 48,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF4F8A8B),
          foregroundColor: Colors.white,
          onPressed: onPressed,
          child: const Icon(Icons.add, size: 28),
        ),
      ),
    );
  }
}
