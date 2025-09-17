import 'package:flutter/material.dart';

class HomeStateCategoryButtons extends StatelessWidget {
  final String estado;
  final String categoria;
  final VoidCallback? onEstadoPressed;
  final VoidCallback? onCategoriaPressed;

  const HomeStateCategoryButtons({
    super.key,
    required this.estado,
    required this.categoria,
    this.onEstadoPressed,
    this.onCategoriaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F8A8B),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: onEstadoPressed,
            icon: const Icon(Icons.bar_chart),
            label: Text(estado),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F8A8B),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: onCategoriaPressed,
            icon: const Icon(Icons.category),
            label: Text(categoria),
          ),
        ),
      ],
    );
  }
}
