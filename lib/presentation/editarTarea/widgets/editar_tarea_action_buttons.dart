import 'package:flutter/material.dart';

class EditarTareaActionButtons extends StatelessWidget {
  final String btnCancelar;
  final String btnGuardar;
  final VoidCallback? onCancelar;
  final VoidCallback? onGuardar;
  const EditarTareaActionButtons({
    super.key,
    required this.btnCancelar,
    required this.btnGuardar,
    this.onCancelar,
    this.onGuardar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancelar,
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
            onPressed: onGuardar,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F8A8B),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(btnGuardar),
          ),
        ),
      ],
    );
  }
}
