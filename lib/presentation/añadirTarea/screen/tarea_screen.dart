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
  final String categoriaTrabajo = '💼 Trabajo';
  final String categoriaPersonal = '🏠 Personal';
  final String categoriaOtro = '✨ Otro';
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
              // Categorías
              TareaCategoriaSelector(
                label: labelCategoria,
                trabajo: categoriaTrabajo,
                personal: categoriaPersonal,
                otro: categoriaOtro,
              ),
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

class _OptionBox extends StatelessWidget {
  final String text;
  const _OptionBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB0B3B8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2D3142),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
