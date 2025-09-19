import 'package:isar/isar.dart';
import 'package:prueba/infrastucture/db/isar/collections/categorias.dart';

class LocalDatabaseCategorias {
  final Isar isar;

  LocalDatabaseCategorias({required this.isar});

  Future guardarOcrearCategoria(CategoriasCollection categoria) async {
    isar.writeTxn(() async {
      return await isar.categoriasCollections.put(categoria);
    });
  }

  Future<List<CategoriasCollection>> traerCategorias() async {
    return await isar.categoriasCollections.where().findAll();
  }

  Future<bool> eliminarCategoria(int id) async {
    return await isar.writeTxn(() async {
      return await isar.categoriasCollections.delete(id);
    });
  }
}
