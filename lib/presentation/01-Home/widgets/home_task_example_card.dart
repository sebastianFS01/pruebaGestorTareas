import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/constants/responsive.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/presentation/01-Home/helpers/tarea_delete_button.dart';
import 'package:prueba/presentation/02-a%C3%B1adirTarea/screen/tarea_screen.dart';

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
        Navigator.of(context).pushNamed(
          TareaScreen.route,
          arguments: {'tarea': tarea, 'isEdit': true},
        );
      },
      child: Stack(
        alignment: AlignmentGeometry.topRight,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(Responsive.width(context, 0.04)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                Responsive.width(context, 0.03),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  blurRadius: Responsive.width(context, 0.02),
                  offset: Offset(0, Responsive.height(context, 0.005)),
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
                        style: TextStyle(
                          color: const Color(0xFF2D3142),
                          fontSize: Responsive.fontSize(context, 16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Responsive.height(context, 0.005)),
                      Text(
                        tarea.description,
                        style: TextStyle(
                          fontSize: Responsive.fontSize(context, 14),
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: tarea.categoria
                            .map((cat) => Chip(label: Text(cat)))
                            .toList(),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '$estado: ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(tarea.estado),
                                const SizedBox(width: 8),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Prioridad: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(tarea.prioridad),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '$totalPoints: ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${tarea.valorPuntos}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: IconButton(
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
                      Consumer(
                        builder: (context, ref, child) {
                          return ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB00020),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              pressButtonEliminar(context, ref, tarea.id!);
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Tarea eliminada')),
                              );
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text('Eliminar'),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
                        ),
            ),
        ],
      ),
    );
  }
}
