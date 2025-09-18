import 'package:flutter/material.dart';

/// Widget reutilizable para añadir y editar tareas.
/// Si [tarea] es null, funciona como añadir; si no, como editar.
class TareaForm extends StatefulWidget {
  final dynamic tarea;
  final void Function(String titulo, String descripcion, String estado, List<String> categorias)? onGuardar;
  final VoidCallback? onCancelar;
  final bool isEdit;

  const TareaForm({
    super.key,
    this.tarea,
    this.onGuardar,
    this.onCancelar,
    this.isEdit = false,
  });

  @override
  State<TareaForm> createState() => _TareaFormState();
}

class _TareaFormState extends State<TareaForm> {
  late TextEditingController _tituloController;
  late TextEditingController _descripcionController;
  String _estado = '';
  List<String> _categorias = [];

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(text: widget.tarea?.title ?? '');
    _descripcionController = TextEditingController(text: widget.tarea?.description ?? '');
    _estado = widget.tarea?.estado ?? '⏳ Pendiente';
    _categorias = widget.tarea?.categoria != null ? List<String>.from(widget.tarea.categoria) : [];
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String labelTitulo = widget.isEdit ? 'Editar título ✏️' : 'Título ✏️';
    final String labelDescripcion = widget.isEdit ? 'Editar descripción 📝' : 'Descripción 📝';
    final String labelEstado = widget.isEdit ? 'Editar estado' : 'Estado';
    final String labelCategoria = widget.isEdit ? 'Editar categorías' : 'Categorías';
    final String btnCancelar = '❌ Cancelar';
    final String btnGuardar = widget.isEdit ? '💾 Guardar cambios' : '💾 Guardar';
    final estados = ['⏳ Pendiente', '🚧 En curso', '✅ Hecho'];
    final categorias = ['💼 Trabajo', '🏠 Personal', '✨ Otro'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título
        TextField(
          controller: _tituloController,
          decoration: InputDecoration(
            labelText: labelTitulo,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.title, color: Color(0xFF4F8A8B)),
          ),
        ),
        const SizedBox(height: 16),
        // Descripción
        TextField(
          controller: _descripcionController,
          maxLines: 2,
          decoration: InputDecoration(
            labelText: labelDescripcion,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.description, color: Color(0xFF4F8A8B)),
          ),
        ),
        const SizedBox(height: 18),
        // Estado
        Text(labelEstado, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142))),
        const SizedBox(height: 6),
        Row(
          children: estados.map((e) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(e),
                selected: _estado == e,
                onSelected: (selected) {
                  if (selected) setState(() => _estado = e);
                },
              ),
            ),
          )).toList(),
        ),
        const SizedBox(height: 18),
        // Categorías
        Text(labelCategoria, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142))),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: categorias.map((cat) => FilterChip(
            label: Text(cat),
            selected: _categorias.contains(cat),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _categorias.add(cat);
                } else {
                  _categorias.remove(cat);
                }
              });
            },
          )).toList(),
        ),
        const SizedBox(height: 18),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onCancelar ?? () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2D3142),
                      side: const BorderSide(color: Color(0xFF2D3142)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(btnCancelar),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.onGuardar != null) {
                        widget.onGuardar!(
                          _tituloController.text,
                          _descripcionController.text,
                          _estado,
                          _categorias,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F8A8B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(btnGuardar),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
