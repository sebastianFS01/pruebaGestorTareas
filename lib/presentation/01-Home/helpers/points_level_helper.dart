// helpers/points_level_helper.dart

/// Calcula el total de puntos según la prioridad de las tareas.
int calcularPuntosTotales(List tareas) {
  int total = 0;
  for (var tarea in tareas) {
    switch (tarea.prioridad.toLowerCase()) {
      case 'alta':
        total += 50;
        break;
      case 'media':
        total += 20;
        break;
      case 'baja':
        total += 10;
        break;
      default:
        total += (tarea.valorPuntos as num).toInt();
    }
  }
  return total;
}

/// Calcula el nivel del usuario según los puntos.
int calcularNivel(int puntos) {
  if (puntos < 100) return 1;
  if (puntos < 250) return 2;
  if (puntos < 500) return 3;
  if (puntos < 1000) return 4;
  if (puntos < 2000) return 5;
  return 6 + ((puntos - 2000) ~/ 1000);
}
