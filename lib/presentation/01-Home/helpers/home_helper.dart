import 'package:flutter/material.dart';
import 'package:prueba/presentation/02-a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/03-Historial/screen/historial_screen.dart';

class NavigatorHelper {
  static void navegandoHaciaTareas(BuildContext context) {
    Navigator.pushNamed(
      context,
      TareaScreen.route,
      arguments: {'isEdit': false},
    );
  }

  static void navegandoHaciaHistorial(BuildContext context) {
    Navigator.pushNamed(context, HistorialScreen().route);
  }
}
