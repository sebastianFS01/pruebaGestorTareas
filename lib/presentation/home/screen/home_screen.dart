import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/home_state_category_buttons.dart';
import '../widgets/home_task_example_card.dart';
import '../widgets/home_task_list_box.dart';
import '../widgets/home_add_task_button.dart';
import '../widgets/home_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // ← ahora con const

  // Textos fijos
  static const String titleApp = "📝 Gestor de Tareas";
  static const String totalPoints = "⭐ Total de puntos";
  static const String estado = "📊 Estado";
  static const String categoria = "🏷️ Categoría";
  static const String tareaEjemplo =
      "📌 Título\n🗒️ Descripción\n🏷️ Categoría seleccionada";
  static const String tareas = "Tareas";
  static const String historial = "Historial";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado modularizado
              HomeHeader(
                titleApp: titleApp,
                totalPoints: totalPoints,
                progress: 0.6, // Cambia este valor por el progreso real
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),

              // Botones estado y categoría modularizados
              HomeStateCategoryButtons(
                estado: estado,
                categoria: categoria,
                onEstadoPressed: () {},
                onCategoriaPressed: () {},
              ),
              const SizedBox(height: 20),

              // Card tarea ejemplo modularizada
              HomeTaskExampleCard(tareaEjemplo: tareaEjemplo),
              const SizedBox(height: 20),

              // Caja de lista modularizada
              const Expanded(child: HomeTaskListBox()),

              const SizedBox(height: 12),

              // Botón "+" modularizado
              HomeAddTaskButton(onPressed: () {}),

              const SizedBox(height: 18),

              // Navegación inferior modularizada
              HomeBottomNavigation(
                tareas: tareas,
                historial: historial,
                onTareasPressed: () {},
                onHistorialPressed: () {
                  Navigator.of(context).pushNamed('/historial');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
