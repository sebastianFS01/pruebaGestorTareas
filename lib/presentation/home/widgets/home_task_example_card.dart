import 'package:flutter/material.dart';

class HomeTaskExampleCard extends StatelessWidget {
  final String tareaEjemplo;

  const HomeTaskExampleCard({
    super.key,
    required this.tareaEjemplo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        tareaEjemplo,
        style: const TextStyle(
          color: Color(0xFF2D3142),
          fontSize: 16,
        ),
      ),
    );
  }
}
