
import 'package:isar/isar.dart';
import 'package:prueba/domain/datasourcers/local-database/local_database_dataresource.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/infrastucture/db/isar/helpers/adapters/tareaAdapter.dart';
import 'package:prueba/infrastucture/db/isar/local_database_helper.dart';
import 'package:prueba/infrastucture/db/isar/queries/local_database_tareas.dart';

class LocalDatabaseDatasourceImpl implements LocalDatabaseDataresource{
  final Future<Isar> _isarFuture = LocalDatabaseHelper.db.isar;
  
  @override
  Future<int> nuevaTarea(Tarea tarea) async {
    final db = await _isarFuture;
    final nuevaTarea = TareaAdapter.toEntity(tarea);
    final res = await LocalDatabaseTareas(isar: db).nuevaTarea(nuevaTarea);
    return res;
  }
}