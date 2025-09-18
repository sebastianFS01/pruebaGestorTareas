import 'package:flutter/material.dart';

class EditarTareaTitleField extends StatelessWidget {
  final String label;
  final String initialValue;
  const EditarTareaTitleField({
    super.key,
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialValue);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D3142),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.title, color: Color(0xFF4F8A8B)),
      ),
    );
  }
}
