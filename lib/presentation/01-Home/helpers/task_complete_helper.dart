// helpers/task_complete_helper.dart
import 'package:prueba/domain/models/tarea.dart';

/// Marca una tarea como completada y retorna una nueva lista sin la tarea original.
List<Tarea> completarTarea(List<Tarea> tareas, Tarea tareaCompletada) {
  return tareas.where((t) => t != tareaCompletada).toList();
}

/// Devuelve los puntos a sumar por una tarea completada.
int puntosPorTarea(Tarea tarea) {
  switch (tarea.prioridad.toLowerCase()) {
    case 'alta':
      return 50;
    case 'media':
      return 20;
    case 'baja':
      return 10;
    default:
      return (tarea.valorPuntos as num).toInt();
  }
}
