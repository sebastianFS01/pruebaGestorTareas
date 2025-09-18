import 'package:prueba/domain/models/categorias.dart';
import 'package:prueba/domain/models/tarea.dart';

abstract class LocalDatabaseDataresource {
  //TAREAS
  Future nuevaTarea(Tarea tarea);
  Future<List<Tarea>> traerTareas();
  Future<bool> eliminarTarea(int id);

  //CATEGORIAS
  Future nuevaCategoria(Categorias categoria);
  Future<List<Categorias>> traerCategorias();
  Future<bool> eliminarCategoria(int id);
}
