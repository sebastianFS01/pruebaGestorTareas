import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/infrastucture/db/isar/local_database_helper.dart';
import 'package:prueba/infrastucture/db/isar/queries/local_database_categorias.dart';
import 'package:prueba/infrastucture/db/isar/collections/categorias.dart';

/// Proveedor de categorías usando Riverpod
//! Se añadio un sstateNotifier que mameje la lista de categorias y metodos para agregar, eliminar y actualizar categorías.
class CategoriasNotifier extends StateNotifier<List<String>> {
  late final LocalDatabaseCategorias _db;

  CategoriasNotifier() : super([]) {
    _init();
  }

  Future<void> _init() async {
    final isar = await LocalDatabaseHelper.db.isar;
    _db = LocalDatabaseCategorias(isar: isar);
    final categorias = await _db.traerCategorias();
    state = categorias.map((c) => c.name ?? '').where((c) => c.isNotEmpty).toList();
  }

  Future<void> addCategoria(String categoria) async {
    if (!state.contains(categoria)) {
      final nueva = CategoriasCollection()..name = categoria;
      await _db.guardarOcrearCategoria(nueva);
      final categorias = await _db.traerCategorias();
      state = categorias.map((c) => c.name ?? '').where((c) => c.isNotEmpty).toList();
    }
  }

  Future<void> removeCategoria(String categoria) async {
    final categorias = await _db.traerCategorias();
    final toDelete = categorias.firstWhere(
      (c) => c.name == categoria,
      orElse: () => CategoriasCollection(),
    );
    if (toDelete.id != 0) {
      await _db.eliminarCategoria(toDelete.id);
      final updated = await _db.traerCategorias();
      state = updated.map((c) => c.name ?? '').where((c) => c.isNotEmpty).toList();
    }
  }

  Future<void> updateCategoria(String oldCat, String newCat) async {
    final categorias = await _db.traerCategorias();
    final toUpdate = categorias.firstWhere(
      (c) => c.name == oldCat,
      orElse: () => CategoriasCollection(),
    );
    if (toUpdate.id != 0) {
      toUpdate.name = newCat;
      await _db.guardarOcrearCategoria(toUpdate);
      final updated = await _db.traerCategorias();
      state = updated.map((c) => c.name ?? '').where((c) => c.isNotEmpty).toList();
    }
  }
}

final categoriasProvider =
    StateNotifierProvider<CategoriasNotifier, List<String>>(
      (ref) => CategoriasNotifier(),
    );
