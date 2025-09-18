import 'package:flutter/material.dart';

class HomeStateCategoryButtons extends StatelessWidget {
  final String selectedEstado;
  final String categoria;
  final ValueChanged<String?>? onEstadoChanged;
  final VoidCallback? onCategoriaPressed;

  static const List<String> estados = ['En curso', 'Completada', 'Pendiente'];

  const HomeStateCategoryButtons({
    super.key,
    required this.selectedEstado,
    required this.categoria,
    this.onEstadoChanged,
    this.onCategoriaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 1),
            decoration: BoxDecoration(
              color: const Color(0xFF4F8A8B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedEstado,
                dropdownColor: const Color(0xFF4F8A8B),
                iconEnabledColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                items: estados.map((estado) {
                  return DropdownMenuItem<String>(
                    value: estado,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.bar_chart,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          estado,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: onEstadoChanged,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Expanded(
        //   child: ElevatedButton.icon(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: const Color(0xFF4F8A8B),
        //       foregroundColor: Colors.white,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       padding: const EdgeInsets.symmetric(vertical: 12),
        //     ),
        //     onPressed: onCategoriaPressed,
        //     icon: const Icon(Icons.category),
        //     label: Text(categoria),
        //   ),
        // ),
      ],
    );
  }
}
