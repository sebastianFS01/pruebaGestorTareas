import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/presentation/02-a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/03-Historial/screen/historial_screen.dart';

import 'package:prueba/presentation/01-Home/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
        HomeScreen().route: (_) => HomeScreen(),
  TareaScreen.route: (_) => const TareaScreen(),
        HistorialScreen().route: (_) => HistorialScreen(),
      },
    );
  }
}
