import 'package:flutter/material.dart';

class EditarTareaDescriptionField extends StatelessWidget {
  final String label;
  const EditarTareaDescriptionField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 2,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.description, color: Color(0xFF4F8A8B)),
      ),
    );
  }
}
