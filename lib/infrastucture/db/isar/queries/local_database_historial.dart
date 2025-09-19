


import 'package:isar/isar.dart';
import 'package:prueba/infrastucture/db/isar/collections/historial.dart';

class LocalDatabaseHistorial {
  final Isar isar;

  LocalDatabaseHistorial({required this.isar});


  Future crearHistorial(HistorialCollection historial) async {
    isar.writeTxn(() async {
      return await isar.historialCollections.put(historial);
    });
  }

  Future <List<HistorialCollection>> traerHistorial() async{
    return await isar.historialCollections.where().findAll();
  }
}
