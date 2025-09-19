<<<<<<< HEAD
import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart';
import 'package:prueba/presentation/01-Home/helpers/init_tareas_helper.dart';
=======
import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart'
    hide categoriasProvider;
// import eliminado: categorias_riverpod.dart (ya no se usa)
import 'package:prueba/presentation/01-Home/helpers/points_level_helper.dart';
>>>>>>> 4daea6259d837e6223d5c4ccd5bdc923fc00a8dc
import 'package:prueba/presentation/02-a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/03-Historial/screen/historial_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/user_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/constants/responsive.dart';
<<<<<<< HEAD
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/presentation/01-Home/helpers/points_level_helper.dart';
=======

import 'package:prueba/presentation/01-Home/helpers/init_tareas_helper.dart';
>>>>>>> 4daea6259d837e6223d5c4ccd5bdc923fc00a8dc
import '../widgets/home_header.dart';
import '../widgets/home_state_category_buttons.dart';
import '../widgets/home_task_example_card.dart';
import '../widgets/category_filter_chips.dart';
import '../widgets/home_add_task_button.dart';
import '../widgets/home_bottom_navigation.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const route = 'home'; 
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Filtro de prioridad
  String selectedPrioridad = 'Todas';
  final List<String> prioridades = ['Todas', 'Alta', 'Media', 'Baja'];
  String? userName;

  static const String titleApp = "📝 Gestor de Tareas";
  static const String categoria = "🏷️ Categoría";
  static const String historial = "Historial";

  String selectedEstado = 'En curso';
  String filtroTareas = 'Filtrar';
  final List<String> opcionesFiltro = ['Filtrar', 'Ver todas'];

  String searchCategoria = '';
  String? selectedCategoria;

  @override
  void initState() {
    super.initState();
    _loadUserName();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initData(context, ref);
    });
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('userName');
    if (name == null || name.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 400));
      final enteredName = await showUserNameDialog(context);
      if (enteredName != null && enteredName.isNotEmpty) {
        await prefs.setString('userName', enteredName);
        setState(() => userName = enteredName);
      }
    } else {
      setState(() => userName = name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tareaList = ref.watch(tareaProvider);
    final puntos = calcularPuntosTotales(tareaList);
    final nivel = calcularNivel(puntos);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.all(Responsive.width(context, 0.045)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                titleApp: userName == null
                    ? titleApp
                    : '$titleApp | 👋 $userName',
                totalPoints: '⭐ Puntos: $puntos   🏆 Nivel: $nivel',
                progress: (puntos % 100) / 100,
              ),
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
                      onCategoriaPressed: null, // Botón eliminado
                    ),
                  ),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: selectedPrioridad,
                    items: prioridades.map((opcion) {
                      return DropdownMenuItem<String>(
                        value: opcion,
                        child: Text('Prioridad: $opcion'),
                      );
                    }).toList(),
                    onChanged: (valor) {
                      setState(() {
                        selectedPrioridad = valor!;
                      });
                    },
                  ),
                ],
              ),
              //! En las categorias ya no se usa provider sino taraeProvider PARA TRAERLAS
              const SizedBox(height: 20),
              // Filtro de categorías dinámico: solo muestra las categorías presentes en las tareas existentes
              Consumer(
                builder: (context, ref, _) {
                  final tareas = ref.watch(tareaProvider);
                  // Extraer todas las categorías únicas de las tareas existentes
                  final Set<String> categoriasUnicas = {};
                  for (final tarea in tareas) {
                    categoriasUnicas.addAll(tarea.categoria);
                  }
                  final categorias = categoriasUnicas.toList();
                  return CategoryFilterChips(
                    categorias: categorias,
                    searchText: searchCategoria,
                    selectedCategoria: selectedCategoria,
                    onSearchChanged: (text) {
                      setState(() {
                        searchCategoria = text;
                      });
                    },
                    onDelete:
                        (
                          _,
                        ) {}, // Eliminar deshabilitado para categorías dinámicas
                    onSelect: (cat) {
                      setState(() {
                        selectedCategoria = cat;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final tareasFiltradas = selectedPrioridad == 'Todas'
                        ? tareaList
                        : tareaList
                              .where(
                                (t) =>
                                    t.prioridad.toLowerCase() ==
                                    selectedPrioridad.toLowerCase(),
                              )
                              .toList();
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            HomeTaskExampleCard(tarea: tareasFiltradas[index]),
                          ],
                        );
                      },
                      itemCount: tareasFiltradas.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: HomeAddTaskButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              TareaScreen.route,
              arguments: {'isEdit': false},
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: HomeBottomNavigation(
            tareas: tareaList.length.toString(),
            historial: historial,
            onTareasPressed: () {},
            onHistorialPressed: () {
              Navigator.pushNamed(context, HistorialScreen.route);
            },
          ),
        ),
      ),
    );
  }
}
