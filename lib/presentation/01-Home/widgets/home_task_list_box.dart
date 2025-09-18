import 'package:flutter/material.dart';

class HomeTaskListBox extends StatelessWidget {
  final Widget? child;

  const HomeTaskListBox({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.07),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child ?? const Center(
        child: Text(
          "Aquí aparecerán tus tareas ✨",
          style: TextStyle(
            color: Color(0xFFB0B3B8),
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
