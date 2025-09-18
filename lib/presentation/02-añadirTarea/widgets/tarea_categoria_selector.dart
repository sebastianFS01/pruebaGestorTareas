import 'package:flutter/material.dart';
import 'tarea_option_box.dart';

class TareaCategoriaSelector extends StatelessWidget {
  final String label;
  final String trabajo;
  final String personal;
  final String otro;
  const TareaCategoriaSelector({
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
            Expanded(child: TareaOptionBox(text: trabajo)),
            const SizedBox(width: 8),
            Expanded(child: TareaOptionBox(text: personal)),
            const SizedBox(width: 8),
            Expanded(child: TareaOptionBox(text: otro)),
          ],
        ),
      ],
    );
  }
}
