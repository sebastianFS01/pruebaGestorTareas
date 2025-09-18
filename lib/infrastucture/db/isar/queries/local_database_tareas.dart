import 'package:isar/isar.dart';
import 'package:prueba/infrastucture/db/isar/collections/tarea.dart';

class LocalDatabaseTareas {
  final Isar isar;

  LocalDatabaseTareas({required this.isar});


  Future guardarOcrearTarea(TareaCollection tarea) async {
    isar.writeTxn(() async {
      return await isar.tareaCollections.put(tarea);
    });
  }

  Future <List<TareaCollection>> traerTareas() async{
    return await isar.tareaCollections.where().findAll();
  }

  Future<bool> eliminarTarea(int id) async{
    return await isar.writeTxn(() async{
      return await isar.tareaCollections.delete(id);
    });
  }
}
