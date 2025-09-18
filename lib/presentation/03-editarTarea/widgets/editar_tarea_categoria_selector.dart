import 'package:flutter/material.dart';

class EditarTareaCategoriaSelector extends StatefulWidget {
  final String label;
  final List<String> initialCategorias;
  const EditarTareaCategoriaSelector({
    super.key,
    required this.label,
    required this.initialCategorias,
    required List<String> categorias,
  });

  @override
  State<EditarTareaCategoriaSelector> createState() =>
      _EditarTareaCategoriaSelectorState();
}

class _EditarTareaCategoriaSelectorState
    extends State<EditarTareaCategoriaSelector> {
  final TextEditingController _controller = TextEditingController();
  late List<String> _categorias;

  @override
  void initState() {
    super.initState();
    _categorias = List<String>.from(widget.initialCategorias);
  }

  void _addCategoria(String value) {
    final text = value.trim();
    if (text.isNotEmpty && !_categorias.contains(text)) {
      setState(() {
        _categorias.add(text);
      });
    }
    _controller.clear();
  }

  void _removeCategoria(String value) {
    setState(() {
      _categorias.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: _categorias
              .map(
                (cat) => Chip(
                  label: Text(cat),
                  onDeleted: () => _removeCategoria(cat),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Escribe una categoría y presiona Enter',
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                ),
                onSubmitted: _addCategoria,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _addCategoria(_controller.text),
            ),
          ],
        ),
      ],
    );
  }
}
