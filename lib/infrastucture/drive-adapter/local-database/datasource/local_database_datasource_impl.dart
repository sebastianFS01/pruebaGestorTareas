import 'package:isar/isar.dart';
import 'package:prueba/domain/datasourcers/local-database/local_database_dataresource.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/infrastucture/db/isar/helpers/adapters/tareaAdapter.dart';
import 'package:prueba/infrastucture/db/isar/local_database_helper.dart';
import 'package:prueba/infrastucture/db/isar/queries/local_database_tareas.dart';

class LocalDatabaseDatasourceImpl implements LocalDatabaseDataresource {
  final Future<Isar> _isarFuture = LocalDatabaseHelper.db.isar;

  @override
  Future nuevaTarea(Tarea tarea) async {
    final db = await _isarFuture;
    final nuevaTarea = TareaAdapter.toEntity(tarea);
    await LocalDatabaseTareas(
      isar: db,
    ).guardarOcrearTarea(nuevaTarea);
  }

  @override
  Future<List<Tarea>> traerTareas() async {
    final db = await _isarFuture;
    final tareas = await LocalDatabaseTareas(isar: db).traerTareas();
    return tareas.map((it) => TareaAdapter.toDomain(it)).toList();
  }
  
  @override
  Future<bool> eliminarTarea() {
    // TODO: implement eliminarTarea
    throw UnimplementedError();
  }
}
