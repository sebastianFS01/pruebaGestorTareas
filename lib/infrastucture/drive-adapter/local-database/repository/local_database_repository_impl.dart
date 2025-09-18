import 'package:prueba/domain/datasourcers/local-database/local_database_dataresource.dart';
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
  Future<bool> eliminarTarea() {
    return datasource.eliminarTarea();
  }
}
