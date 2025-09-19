import 'package:prueba/domain/datasourcers/local-database/local_database_dataresource.dart';
import 'package:prueba/domain/models/categorias.dart';
import 'package:prueba/domain/models/historial.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/domain/repositories/local-database/local_database_repository.dart';

class LocalDatabaseRepositoryImpl implements LocalDatabaseRepository {
  final LocalDatabaseDataresource datasource;

  LocalDatabaseRepositoryImpl({required this.datasource});

  @override
  Future nuevaTarea(Tarea tarea) {
    return datasource.nuevaTarea(tarea);
  }

  @override
  Future<List<Tarea>> traerTareas() {
    return datasource.traerTareas();
  }
  
  @override
  Future<bool> eliminarTarea(int id) {
    return datasource.eliminarTarea(id);
  }
  
  @override
  Future<bool> eliminarCategoria(int id) {
    return datasource.eliminarCategoria(id);
  }
  
  @override
  Future nuevaCategoria(Categorias categoria) {
    return datasource.nuevaCategoria(categoria);
  }
  
  @override
  Future<List<Categorias>> traerCategorias() {
    return datasource.traerCategorias();
  }

  @override
  Future nuevoHistorial(Historial historial) {
    return datasource.nuevoHistorial(historial);
  }

  @override
  Future<List<Historial>> traerHistorial() {
    return datasource.traerHistorial();
  }
}
