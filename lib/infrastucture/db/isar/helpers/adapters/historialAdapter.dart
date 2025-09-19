
import 'package:prueba/domain/models/historial.dart';
import 'package:prueba/infrastucture/db/isar/collections/historial.dart';

class HistorialAdapter {


  static HistorialCollection toEntity(Historial historial){
    return HistorialCollection()
   ..titulo = historial.titulo
   ..puntosObtenidos = historial.puntosObtenidos
   ..fechaFinalizacion = historial.fechaFinalizacion;
  }

  static Historial toDomain(HistorialCollection historialCollections){
    return Historial(
      id: historialCollections.id,
      titulo: historialCollections.titulo!,
      puntosObtenidos: historialCollections.puntosObtenidos!,
      fechaFinalizacion: historialCollections.fechaFinalizacion!
     );
  }

}