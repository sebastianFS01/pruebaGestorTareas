import 'package:flutter/material.dart';
import '../widgets/historial_nota_tile.dart';

class HistorialScreen extends StatelessWidget {
  static const String route = 'historialScreen';
  const HistorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ejemplo de datos de historial (solo para UI)
    final List<Map<String, String>> historialNotas = [
      {
        'titulo': 'Comprar víveres',
        'descripcion': 'Ir al super y comprar frutas 🍎',
        'fecha': '2025-09-17',
        'hora': '10:30 AM',
      },
      {
        'titulo': 'Reunión de trabajo',
        'descripcion': 'Presentar avances del proyecto 💼',
        'fecha': '2025-09-16',
        'hora': '03:00 PM',
      },
      {
        'titulo': 'Estudiar Flutter',
        'descripcion': 'Repasar widgets y layouts 📱',
        'fecha': '2025-09-15',
        'hora': '08:00 PM',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3142),
        title: const Text(
          'Historial de Tareas',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.separated(
          itemCount: historialNotas.length,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final nota = historialNotas[index];
            return HistorialNotaTile(
              titulo: nota['titulo'] ?? '',
              descripcion: nota['descripcion'] ?? '',
              fecha: nota['fecha'] ?? '',
              hora: nota['hora'] ?? '',
            );
          },
        ),
      ),
    );
  }
}
