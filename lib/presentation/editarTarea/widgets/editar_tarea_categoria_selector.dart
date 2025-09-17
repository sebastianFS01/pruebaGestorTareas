import 'package:flutter/material.dart';
import 'editar_tarea_option_box.dart';

class EditarTareaCategoriaSelector extends StatelessWidget {
  final String label;
  final String trabajo;
  final String personal;
  final String otro;
  const EditarTareaCategoriaSelector({
    super.key,
    required this.label,
    required this.trabajo,
    required this.personal,
    required this.otro,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(child: EditarTareaOptionBox(text: trabajo)),
            const SizedBox(width: 8),
            Expanded(child: EditarTareaOptionBox(text: personal)),
            const SizedBox(width: 8),
            Expanded(child: EditarTareaOptionBox(text: otro)),
          ],
        ),
      ],
    );
  }
}
