import 'package:flutter/material.dart';
import 'editar_tarea_option_box.dart';

class EditarTareaCategoriaSelector extends StatefulWidget {
  final String label;
  final List<String> categorias;
  final List<String> initialCategorias;
  const EditarTareaCategoriaSelector({
    super.key,
    required this.label,
    required this.categorias,
    required this.initialCategorias,
  });

  @override
  State<EditarTareaCategoriaSelector> createState() => _EditarTareaCategoriaSelectorState();
}

class _EditarTareaCategoriaSelectorState extends State<EditarTareaCategoriaSelector> {
  late List<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List<String>.from(widget.initialCategorias);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: widget.categorias.map((cat) => _buildChip(cat)).toList(),
        ),
      ],
    );
  }

  Widget _buildChip(String cat) {
    final isSelected = _selected.contains(cat);
    return FilterChip(
      label: Text(cat),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            _selected.add(cat);
          } else {
            _selected.remove(cat);
          }
        });
      },
      selectedColor: const Color(0xFF4F8A8B).withOpacity(0.15),
      checkmarkColor: const Color(0xFF4F8A8B),
    );
  }
}
