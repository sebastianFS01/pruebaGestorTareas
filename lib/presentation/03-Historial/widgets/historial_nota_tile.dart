import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistorialNotaTile extends StatelessWidget {
  final String titulo;
  final DateTime fecha;
  final int puntosObtenidos;

  const HistorialNotaTile({
    super.key,
    required this.titulo,
    required this.fecha,
    required this.puntosObtenidos,
  });


  @override
  Widget build(BuildContext context) {
      final String fechaFormateada = DateFormat('dd/MM/yyyy').format(fecha);
    return Container(
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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: Color(0xFF2D3142),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              titulo,
              style: const TextStyle(color: Color(0xFF4F8A8B), fontSize: 15),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Color(0xFFB0B3B8),
                ),
                const SizedBox(width: 4),
                Text(
                  fechaFormateada,
                  style: const TextStyle(
                    color: Color(0xFFB0B3B8),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.pin_outlined,
                  size: 16,
                  color: Color(0xFFB0B3B8),
                ),
                const SizedBox(width: 4),
                Text(
                  puntosObtenidos.toString(),
                  style: const TextStyle(
                    color: Color(0xFFB0B3B8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF4F8A8B),
          child: Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }
}
