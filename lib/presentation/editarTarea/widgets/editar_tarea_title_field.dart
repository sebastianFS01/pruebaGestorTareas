import 'package:flutter/material.dart';

class EditarTareaTitleField extends StatelessWidget {
  final String label;
  const EditarTareaTitleField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.title, color: Color(0xFF4F8A8B)),
      ),
    );
  }
}
