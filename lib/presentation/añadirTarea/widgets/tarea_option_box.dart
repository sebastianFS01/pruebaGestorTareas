import 'package:flutter/material.dart';

class TareaOptionBox extends StatelessWidget {
  final String text;
  const TareaOptionBox({super.key, required this.text});

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
