import 'package:flutter/material.dart';

class HomeStateCategoryButtons extends StatelessWidget {
  final String selectedEstado;
  final String categoria;
  final ValueChanged<String?>? onEstadoChanged;
  final VoidCallback? onCategoriaPressed;

  static const List<String> estados = ['En curso', 'Completada', 'Pendiente'];

  const HomeStateCategoryButtons({
    super.key,
    required this.selectedEstado,
    required this.categoria,
    this.onEstadoChanged,
    this.onCategoriaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: const Color(0xFF4F8A8B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedEstado,
          dropdownColor: const Color(0xFF4F8A8B),
          iconEnabledColor: Colors.white,
          isExpanded: true, // Asegura que el botón use todo el ancho disponible
          alignment: Alignment.center, // Centra el texto en el botón
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          items: estados.map((estado) {
            return DropdownMenuItem<String>(
              value: estado,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centra ícono + texto
                children: [
                  const Icon(Icons.bar_chart, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(estado, style: const TextStyle(color: Colors.white)),
                ],
              ),
            );
          }).toList(),
          onChanged: onEstadoChanged,
        ),
      ),
    );
  }
}
