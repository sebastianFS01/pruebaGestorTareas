import 'package:flutter/material.dart';

class TareaPreviewBox extends StatelessWidget {
  const TareaPreviewBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFB0B3B8)),
      ),
      alignment: Alignment.centerLeft,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          '📝 Escribe una nota o recordatorio...',
          style: TextStyle(color: Color(0xFFB0B3B8)),
        ),
      ),
    );
  }
}
