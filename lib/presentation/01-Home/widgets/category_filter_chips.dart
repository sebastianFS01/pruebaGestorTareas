import 'package:flutter/material.dart';

class CategoryFilterChips extends StatelessWidget {
  final List<String> categorias;
  final String searchText;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onSelect;
  final String? selectedCategoria;

  const CategoryFilterChips({
    super.key,
    required this.categorias,
    required this.searchText,
    required this.onSearchChanged,
    required this.onDelete,
    required this.onSelect,
    this.selectedCategoria,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = categorias.where((cat) => cat.toLowerCase().contains(searchText.toLowerCase())).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Buscar categoría',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: onSearchChanged,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: filtered.isEmpty
              ? [const Text('No hay categorías')] 
              : filtered.map((cat) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ActionChip(
                        label: Text(cat),
                        backgroundColor: selectedCategoria == cat ? Colors.teal : Colors.grey[200],
                        labelStyle: TextStyle(color: selectedCategoria == cat ? Colors.white : Colors.black),
                        avatar: const Icon(Icons.category, size: 18),
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        onPressed: () => onSelect(cat),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        tooltip: 'Eliminar',
                        onPressed: () => onDelete(cat),
                      ),
                    ],
                  )).toList(),
        ),
      ],
    );
  }
}
