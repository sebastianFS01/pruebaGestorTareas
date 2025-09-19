import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/constants/responsive.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/presentation/02-a%C3%B1adirTarea/helpers/tarea_logic_button.dart';
import '../widgets/tarea_form.dart';

class TareaScreen extends StatelessWidget {
  static const String route = 'tareaScreen';

  const TareaScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final Tarea tarea = args['tarea'];
    final isEdit = args['isEdit'] ?? false;

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
          child: Consumer(
            builder: (context, ref, child) {
              return TareaForm(
                tarea: tarea,
                isEdit: isEdit,
                onCancelar: () => Navigator.of(context).pop(),
                onGuardar:
                    (titulo, descripcion, estado, categorias, prioridad) {
                      pressButtonCrear(
                        context,
                        ref,
                        Tarea(
                          id: tarea.id,
                          estado: estado,
                          prioridad: prioridad,
                          valorPuntos: 50,
                          title: titulo,
                          description: descripcion,
                          categoria: categorias,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
              );
            },
          ),
        ),
      ),
    );
  }
}
