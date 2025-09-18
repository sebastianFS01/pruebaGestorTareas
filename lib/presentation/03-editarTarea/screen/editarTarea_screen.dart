import 'package:flutter/material.dart';
import '../widgets/editar_tarea_title_field.dart';
import '../widgets/editar_tarea_description_field.dart';
import '../widgets/editar_tarea_estado_selector.dart';
import '../widgets/editar_tarea_categoria_selector.dart';

import '../widgets/editar_tarea_action_buttons.dart';

class EditarTareaScreen extends StatelessWidget {
  final dynamic tarea;
  const EditarTareaScreen({super.key, this.tarea});
  // Variables de texto y etiquetas para edición
  final String titleAppBar = '✏️ Editar Tarea';
  final String labelTitulo = 'Editar título ✏️';
  final String labelDescripcion = 'Editar descripción 🗒️';
  final String labelEstado = 'Editar estado';
  final String labelCategoria = 'Editar categorías';
  final String estadoPendiente = '⏳ Pendiente';
  final String estadoEnCurso = '🚧 En curso';
  final String estadoHecho = '✅ Hecho';
  final String categoriaTrabajo = '💼 Trabajo';
  final String categoriaPersonal = '🏠 Personal';
  final String categoriaOtro = '✨ Otro';
  final String btnCancelar = '❌ Cancelar';
  final String btnGuardar = '💾 Guardar cambios';

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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            EditarTareaTitleField(
              label: labelTitulo,
              initialValue: tarea != null && tarea.title != null
                  ? tarea.title
                  : '',
            ),
            const SizedBox(height: 16),
            // Descripción
            EditarTareaDescriptionField(
              label: labelDescripcion,
              initialValue: tarea != null && tarea.description != null
                  ? tarea.description
                  : '',
            ),
            const SizedBox(height: 18),
            // Estado
            EditarTareaEstadoSelector(
              label: labelEstado,
              pendiente: estadoPendiente,
              enCurso: estadoEnCurso,
              hecho: estadoHecho,
              initialEstado: tarea != null && tarea.estado != null
                  ? tarea.estado
                  : estadoPendiente,
            ),
            const SizedBox(height: 18),
            // Categorías
            EditarTareaCategoriaSelector(
              label: labelCategoria,
              categorias: [categoriaTrabajo, categoriaPersonal, categoriaOtro],
              initialCategorias: tarea != null && tarea.categoria != null
                  ? List<String>.from(tarea.categoria)
                  : [],
            ),
            const SizedBox(height: 18),
            const Spacer(),
            // Botones centrados en un box
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                  horizontal: 0,
                ),
                width: double.infinity,
                child: EditarTareaActionButtons(
                  btnCancelar: btnCancelar,
                  btnGuardar: btnGuardar,
                  onCancelar: () {
                    Navigator.of(context).pop();
                  },
                  onGuardar: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
