import 'package:flutter/material.dart';

class EditarTareaEstadoSelector extends StatefulWidget {
  final String label;
  final String pendiente;
  final String enCurso;
  final String hecho;
  final String initialEstado;
  const EditarTareaEstadoSelector({
    super.key,
    required this.label,
    required this.pendiente,
    required this.enCurso,
    required this.hecho,
    required this.initialEstado,
  });

  @override
  State<EditarTareaEstadoSelector> createState() =>
      _EditarTareaEstadoSelectorState();
}

class _EditarTareaEstadoSelectorState extends State<EditarTareaEstadoSelector> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialEstado;
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
        Row(
          children: [
            Expanded(child: _buildOption(widget.pendiente)),
            const SizedBox(width: 8),
            Expanded(child: _buildOption(widget.enCurso)),
            const SizedBox(width: 8),
            Expanded(child: _buildOption(widget.hecho)),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(String value) {
    final isSelected = _selected == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF4F8A8B).withOpacity(0.15)
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? const Color(0xFF4F8A8B)
                : const Color(0xFFB0B3B8),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 38,
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            color: isSelected
                ? const Color(0xFF4F8A8B)
                : const Color(0xFF2D3142),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
