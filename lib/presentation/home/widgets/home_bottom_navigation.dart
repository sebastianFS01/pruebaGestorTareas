import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatelessWidget {
  final String tareas;
  final String historial;
  final VoidCallback? onTareasPressed;
  final VoidCallback? onHistorialPressed;

  const HomeBottomNavigation({
    super.key,
    required this.tareas,
    required this.historial,
    this.onTareasPressed,
    this.onHistorialPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D3142),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: onTareasPressed,
            icon: const Icon(Icons.list_alt),
            label: Text(tareas),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB0B3B8),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: onHistorialPressed,
            icon: const Icon(Icons.history),
            label: Text(historial),
          ),
        ),
      ],
    );
  }
}
