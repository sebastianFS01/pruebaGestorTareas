import 'package:flutter/material.dart';
import 'package:prueba/configuration/constants/responsive.dart';
import '../widgets/tarea_form.dart';

class TareaScreen extends StatelessWidget {
  static const String route = 'tareaScreen';

  const TareaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final tarea = args != null && args.containsKey('tarea')
        ? args['tarea']
        : null;
    final isEdit = args != null && args['isEdit'] == true;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3142),
        title: Text(
          isEdit ? '✏️ Editar Tarea' : '📝 Nueva Tarea',
          style: TextStyle(
            color: Colors.white,
            fontSize: Responsive.fontSize(context, 18),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Responsive.width(context, 0.045)),
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
