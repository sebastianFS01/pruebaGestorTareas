class Tarea {
  final int? id;
  final String title;
  final String description;
  final String estado;
  final String prioridad;
  final List<String> categoria;
  final int valorPuntos;

  Tarea( {
    this.id,
    required this.estado,
    required this.prioridad,
    required this.valorPuntos,
    required this.title,
    required this.description,
    required this.categoria,
  });
}
