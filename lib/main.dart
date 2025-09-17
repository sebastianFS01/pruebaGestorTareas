import 'package:flutter/material.dart';
import 'package:prueba/presentation/a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/historial/screen/historial_screen.dart';

import 'package:prueba/presentation/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestor de tareas',
      initialRoute: HomeScreen().route,
      routes: {
        HomeScreen().route : (_) => HomeScreen(),
        TareaScreen().route : (_) => TareaScreen(),
        HistorialScreen().route : (_) => HistorialScreen(),
      },
    );
  }
}
