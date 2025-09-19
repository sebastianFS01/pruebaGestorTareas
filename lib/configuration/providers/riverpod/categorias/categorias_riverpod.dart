import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Proveedor de categorías usando Riverpod
//! Se añadio un sstateNotifier que mameje la lista de categorias y metodos para agregar, eliminar y actualizar categorías.
class CategoriasNotifier extends StateNotifier<List<String>> {
  CategoriasNotifier() : super(['Hogar', 'Limpieza', 'Trabajo', 'Personal']);

  void addCategoria(String categoria) {
    if (!state.contains(categoria)) {
      state = [...state, categoria];
    }
  }

  void removeCategoria(String categoria) {
    state = state.where((c) => c != categoria).toList();
  }

  void updateCategoria(String oldCat, String newCat) {
    state = [
      for (final c in state)
        if (c == oldCat) newCat else c,
    ];
  }
}

final categoriasProvider =
    StateNotifierProvider<CategoriasNotifier, List<String>>(
      (ref) => CategoriasNotifier(),
    );
