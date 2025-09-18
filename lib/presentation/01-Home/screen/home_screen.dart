import 'package:flutter/material.dart';
import 'package:prueba/configuration/constants/responsive.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/presentation/01-Home/helpers/home_helper.dart';
import '../widgets/home_header.dart';
import '../widgets/home_state_category_buttons.dart';
import '../widgets/home_task_example_card.dart';
import '../widgets/category_filter_chips.dart';
import '../widgets/home_add_task_button.dart';
import '../widgets/home_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  final route = 'home';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String titleApp = "📝 Gestor de Tareas";
  static const String totalPoints = "⭐ Total de puntos";
  static const String categoria = "🏷️ Categoría";
  static const String tareas = "Tareas";
  static const String historial = "Historial";

  String selectedEstado = 'En curso';
  String filtroTareas = 'Filtrar';
  final List<String> opcionesFiltro = ['Filtrar', 'Ver todas'];

  // Estado local para categorías
  List<String> categoriasUsuario = ['Hogar', 'Limpieza', 'Trabajo', 'Personal'];
  String searchCategoria = '';
  String? selectedCategoria;

  final Tarea tareaEjemplo = Tarea(
    title: 'Desarrollo de aplicación',
    description: 'Desarrollar una app de gestión de tareas en Flutter',
    categoria: ['Trabajo', 'Desarrollo'],
    estado: 'En curso',
    prioridad: 'Alta',
    valorPuntos: 50,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.all(Responsive.width(context, 0.045)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                titleApp: titleApp,
                totalPoints: totalPoints,
                progress: 0.6,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: HomeStateCategoryButtons(
                      selectedEstado: selectedEstado,
                      categoria: categoria,
                      onEstadoChanged: (estado) {
                        setState(() {
                          selectedEstado = estado!;
                        });
                      },
                      onCategoriaPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: filtroTareas,
                    items: opcionesFiltro.map((opcion) {
                      return DropdownMenuItem<String>(
                        value: opcion,
                        child: Text(opcion),
                      );
                    }).toList(),
                    onChanged: (valor) {
                      setState(() {
                        filtroTareas = valor!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Filtro de categorías
              CategoryFilterChips(
                categorias: categoriasUsuario,
                searchText: searchCategoria,
                selectedCategoria: selectedCategoria,
                onSearchChanged: (text) {
                  setState(() {
                    searchCategoria = text;
                  });
                },
                onDelete: (cat) {
                  setState(() {
                    categoriasUsuario.remove(cat);
                    if (selectedCategoria == cat) selectedCategoria = null;
                  });
                },
                onSelect: (cat) {
                  setState(() {
                    selectedCategoria = cat;
                  });
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    // Aquí podrías filtrar las tareas por estado/categoría si tuvieras una lista
                    return Column(
                      children: [HomeTaskExampleCard(tarea: tareaEjemplo)],
                    );
                  },
                  itemCount: 1,
                ),
              ),
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
