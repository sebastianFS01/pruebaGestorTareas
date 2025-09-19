class Historial {
  final int? id;
  final String titulo;
  final DateTime fechaFinalizacion;
  final int puntosObtenidos;

  Historial({
    this.id,
    required this.puntosObtenidos,
    required this.titulo,
    required this.fechaFinalizacion,
  });
}
