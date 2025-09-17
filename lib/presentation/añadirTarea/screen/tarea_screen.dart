import 'package:flutter/material.dart';
import '../widgets/tarea_title_field.dart';
import '../widgets/tarea_description_field.dart';
import '../widgets/tarea_estado_selector.dart';
import '../widgets/tarea_categoria_selector.dart';
import '../widgets/tarea_preview_box.dart';
import '../widgets/tarea_action_buttons.dart';

class TareaScreen extends StatelessWidget {
  final String route = 'tareaScreen';
  const TareaScreen({super.key});

  // Variables de texto y etiquetas
  final String titleAppBar = '📝 Nueva Tarea';
  final String labelTitulo = 'Título ✏️';
  final String labelDescripcion = 'Descripción 🗒️';
  final String labelEstado = 'Estado';
  final String labelCategoria = 'Categorías';
  final String estadoPendiente = '⏳ Pendiente';
  final String estadoEnCurso = '🚧 En curso';
  final String estadoHecho = '✅ Hecho';
  // final String categoriaTrabajo = '💼 Trabajo';
  // final String categoriaPersonal = '🏠 Personal';
  // final String categoriaOtro = '✨ Otro';
  final String btnCancelar = '❌ Cancelar';
  final String btnGuardar = '💾 Guardar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3142),
        title: Text(titleAppBar, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              TareaTitleField(label: labelTitulo),
              const SizedBox(height: 16),
              // Descripción
              TareaDescriptionField(label: labelDescripcion),
              const SizedBox(height: 18),
              // Estado
              TareaEstadoSelector(
                label: labelEstado,
                pendiente: estadoPendiente,
                enCurso: estadoEnCurso,
                hecho: estadoHecho,
              ),
              const SizedBox(height: 18),
              // Categorías (ahora campo editable)
              _CategoriaInputField(label: labelCategoria),
              const SizedBox(height: 18),
              // Espacio para preview o notas extra
              const TareaPreviewBox(),
              // Botones centrados en un box
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 0,
                  ),
                  width: double.infinity,
                  child: TareaActionButtons(
                    btnCancelar: btnCancelar,
                    btnGuardar: btnGuardar,
                    onCancelar: () {},
                    onGuardar: () {},
                  ),
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}

// Widget para ingresar categorías personalizadas
class _CategoriaInputField extends StatefulWidget {
  final String label;
  const _CategoriaInputField({required this.label});

  @override
  State<_CategoriaInputField> createState() => _CategoriaInputFieldState();
}

class _CategoriaInputFieldState extends State<_CategoriaInputField> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _categorias = [];

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
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: _categorias
              .map((cat) => Chip(
                    label: Text(cat),
                    onDeleted: () => _removeCategoria(cat),
                  ))
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
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
