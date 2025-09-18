import 'package:flutter/material.dart';
import 'tarea_option_box.dart';

class TareaEstadoSelector extends StatelessWidget {
  final String label;
  final String pendiente;
  final String enCurso;
  final String hecho;
  const TareaEstadoSelector({
    super.key,
    required this.label,
    required this.pendiente,
    required this.enCurso,
    required this.hecho,
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
            Expanded(child: TareaOptionBox(text: pendiente)),
            const SizedBox(width: 8),
            Expanded(child: TareaOptionBox(text: enCurso)),
            const SizedBox(width: 8),
            Expanded(child: TareaOptionBox(text: hecho)),
          ],
        ),
      ],
    );
  }
}
