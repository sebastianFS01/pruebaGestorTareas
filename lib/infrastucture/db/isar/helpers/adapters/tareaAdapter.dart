

import 'package:isar/isar.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/infrastucture/db/isar/collections/tarea.dart';

class TareaAdapter {


  static TareaCollection toEntity(Tarea tarea){
    return TareaCollection()
   ..title = tarea.title
   ..description = tarea.description
   ..estado = tarea.estado
   ..prioridad = tarea.prioridad
   ..categoria = tarea.categoria
   ..valorPuntos = tarea.valorPuntos;
  }

  static Tarea toDomain(TareaCollection tareaCollections){
    return Tarea(
      id: tareaCollections.id,
      estado: tareaCollections.estado!, 
      prioridad: tareaCollections.prioridad!, 
      valorPuntos: tareaCollections.valorPuntos!, 
      title: tareaCollections.title!, 
      description: tareaCollections.description!, 
      categoria: tareaCollections.categoria!);
  }

}