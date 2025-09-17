import 'package:flutter/material.dart';

class TareaScreen extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            TextField(
              decoration: InputDecoration(
                labelText: labelTitulo,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.title, color: Color(0xFF4F8A8B)),
              ),
            ),
            const SizedBox(height: 16),
            // Descripción
            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                labelText: labelDescripcion,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.description,
                  color: Color(0xFF4F8A8B),
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Estado
            Text(
              labelEstado,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3142),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(child: _OptionBox(text: estadoPendiente)),
                const SizedBox(width: 8),
                Expanded(child: _OptionBox(text: estadoEnCurso)),
                const SizedBox(width: 8),
                Expanded(child: _OptionBox(text: estadoHecho)),
              ],
            ),
            const SizedBox(height: 18),
            // Categorías
            Text(
              labelCategoria,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3142),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(child: _OptionBox(text: categoriaTrabajo)),
                const SizedBox(width: 8),
                Expanded(child: _OptionBox(text: categoriaPersonal)),
                const SizedBox(width: 8),
                Expanded(child: _OptionBox(text: categoriaOtro)),
              ],
            ),
            const SizedBox(height: 18),
            // Espacio para preview o notas extra
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFB0B3B8)),
              ),
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '📝 Escribe una nota o recordatorio...',
                  style: TextStyle(color: Color(0xFFB0B3B8)),
                ),
              ),
            ),
            const Spacer(),
            // Botones
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
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
                    onPressed: () {},
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
          ],
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
