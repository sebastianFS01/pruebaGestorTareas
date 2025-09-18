import 'package:flutter/material.dart';
import '../widgets/tarea_form.dart';

class TareaScreen extends StatelessWidget {
  final String route = 'tareaScreen';
  final dynamic tarea;
  final bool isEdit;
  const TareaScreen({super.key, this.tarea, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3142),
        title: Text(isEdit ? '✏️ Editar Tarea' : '📝 Nueva Tarea', style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TareaForm(
            tarea: tarea,
            isEdit: isEdit,
            onCancelar: () => Navigator.of(context).pop(),
            onGuardar: (titulo, descripcion, estado, categorias) {
              // TODO: Implementar lógica de guardado/edición
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
