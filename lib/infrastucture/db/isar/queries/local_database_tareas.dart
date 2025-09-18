import 'package:isar/isar.dart';
import 'package:prueba/infrastucture/db/isar/collections/tarea.dart';

class LocalDatabaseTareas {
  final Isar isar;

  LocalDatabaseTareas({required this.isar});

  Future<int> nuevaTarea(TareaCollection tarea) async {
    final db = isar;
    final res = db.writeTxn(() async {
      return await db.tareaCollections.put(tarea);
    });
    return res;
  }
}
