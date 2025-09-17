import 'package:flutter/material.dart';
import 'package:prueba/presentation/a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/historial/screen/historial_screen.dart';

class NavigatorHelper{

  static void navegandoHaciaTareas(BuildContext context){
    Navigator.pushNamed(context, TareaScreen().route);
  }

    static void navegandoHaciaHistorial(BuildContext context){
    Navigator.pushNamed(context, HistorialScreen().route);
  }

}