import 'package:flutter/material.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/presentation/home/helpers/home_helper.dart';
import '../widgets/home_header.dart';
import '../widgets/home_state_category_buttons.dart';
import '../widgets/home_task_example_card.dart';
import '../widgets/home_add_task_button.dart';
import '../widgets/home_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  final route = 'home';
  HomeScreen({super.key}); // ← ahora con const

  // Textos fijos
  static const String titleApp = "📝 Gestor de Tareas";
  static const String totalPoints = "⭐ Total de puntos";
  static const String estado = "📊 Estado";
  static const String categoria = "🏷️ Categoría";
  final Tarea tareaEjemplo = Tarea(
    title: 'Lavar la loza',
    description: 'Coger el jabon y lave esa vaina puerco',
    categoria: ['Hogar', 'Limpieza'],
    estado: 'En curso',
    prioridad: 'Alta',
    valorPuntos: 20,
  );
  static const String tareas = "Tareas";
  static const String historial = "Historial";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [HomeTaskExampleCard(tarea: tareaEjemplo)],
                    );
                  },
                  itemCount: 1,
                ),
              ),

              // Caja de lista modularizada
              // const Expanded(child: HomeTaskListBox()),
            ],
          ),
        ),
        floatingActionButton: HomeAddTaskButton(
          onPressed: () {
            NavigatorHelper.navegandoHaciaTareas(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: HomeBottomNavigation(
            tareas: tareas,
            historial: historial,
            onTareasPressed: () {},
            onHistorialPressed: () {
              NavigatorHelper.navegandoHaciaHistorial(context);
            },
          ),
        ),
      ),
    );
  }
}
