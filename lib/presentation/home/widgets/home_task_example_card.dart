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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              tareaEjemplo,
              style: const TextStyle(
                color: Color(0xFF2D3142),
                fontSize: 16,
              ),
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
                  content: const Text('¿Estás seguro de que deseas eliminar esta tarea? Esta acción no se puede deshacer.'),
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
    );
  }
}
