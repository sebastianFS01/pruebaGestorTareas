class Tarea {
  final String title;
  final String description;
  final String estado;
  final String prioridad;
  final List<String> categoria;
  final int valorPuntos;

  Tarea( {
    required this.estado,
    required this.prioridad,
    required this.valorPuntos,
    required this.title,
    required this.description,
    required this.categoria,
  });
}
