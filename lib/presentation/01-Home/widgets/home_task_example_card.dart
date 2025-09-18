import 'package:flutter/material.dart';
import 'package:prueba/domain/models/tarea.dart';

class HomeTaskExampleCard extends StatelessWidget {
  // Textos fijos reutilizables
  static const String titleApp = "📝 Gestor de Tareas";
  static const String totalPoints = "⭐ Total de puntos";
  static const String estado = "📊 Estado";
  static const String categoria = "🏷️ Categoría";
  static const String tareas = "Tareas";
  static const String historial = "Historial";

  final Tarea tarea;

  const HomeTaskExampleCard({super.key, required this.tarea});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/editarTarea', arguments: tarea);
      },
      child: Container(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tarea.title,
                    style: const TextStyle(
                      color: Color(0xFF2D3142),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tarea.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: tarea.categoria
                        .map((cat) => Chip(label: Text(cat)))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '$estado: ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(tarea.estado),
                      const SizedBox(width: 16),
                      Text(
                        'Prioridad: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(tarea.prioridad),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '$totalPoints: ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${tarea.valorPuntos}'),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Color(0xFFB00020)),
              tooltip: 'Eliminar tarea',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('¿Eliminar tarea?'),
                    content: const Text(
                      '¿Estás seguro de que deseas eliminar esta tarea? Esta acción no se puede deshacer.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFB00020),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // Aquí iría la lógica real de eliminar
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Tarea eliminada')),
                          );
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
