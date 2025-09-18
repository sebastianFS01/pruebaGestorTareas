import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart';
import 'package:prueba/presentation/02-a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/03-Historial/screen/historial_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/user_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/constants/responsive.dart';
import 'package:prueba/domain/models/tarea.dart';
<<<<<<< HEAD
import 'package:prueba/presentation/01-Home/helpers/init_tareas_helper.dart';
=======
import 'package:prueba/presentation/01-Home/helpers/init_data_helper.dart';
import 'package:prueba/presentation/01-Home/helpers/points_level_helper.dart';
>>>>>>> 2e24f759d5f46d79e0499466be35c9e87c8e6e66
import '../widgets/home_header.dart';
import '../widgets/home_state_category_buttons.dart';
import '../widgets/home_task_example_card.dart';
import '../widgets/category_filter_chips.dart';
import '../widgets/home_add_task_button.dart';
import '../widgets/home_bottom_navigation.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const route = 'home'; // 👈 mejor static const
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Filtro de prioridad
  String selectedPrioridad = 'Todas';
  final List<String> prioridades = ['Todas', 'Alta', 'Media', 'Baja'];
  String? userName;

  List<Tarea> tareasCompletas = [];
  List<Tarea> tareasPendientes = [];
  int puntos = 0;
  int nivel = 1;

  // 👇 mover aquí tareasIniciales
  final List<Tarea> tareasIniciales = [
    Tarea(
      title: 'Desarrollo de aplicación',
      description: 'Desarrollar una app de gestión de tareas en Flutter',
      categoria: ['Trabajo', 'Desarrollo'],
      estado: 'En curso',
      prioridad: 'Alta',
      valorPuntos: 50,
    ),
    Tarea(
      title: 'Limpiar escritorio',
      description: 'Organizar y limpiar el escritorio de trabajo',
      categoria: ['Hogar'],
      estado: 'Pendiente',
      prioridad: 'Baja',
      valorPuntos: 10,
    ),
    Tarea(
      title: 'Revisar correos',
      description: 'Responder correos importantes',
      categoria: ['Trabajo'],
      estado: 'Hecho',
      prioridad: 'Media',
      valorPuntos: 20,
    ),
  ];

  static const String titleApp = "📝 Gestor de Tareas";
  static const String categoria = "🏷️ Categoría";
  static const String historial = "Historial";

  String selectedEstado = 'En curso';
  String filtroTareas = 'Filtrar';
  final List<String> opcionesFiltro = ['Filtrar', 'Ver todas'];

  // Estado local para categorías
  List<String> categoriasUsuario = ['Hogar', 'Limpieza', 'Trabajo', 'Personal'];
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
    final puntos = calcularPuntosTotales(tareasIniciales);
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
                child: Consumer(
                  builder: (context, ref, child) {
                    final tareaEjemplo = ref.watch(tareaProvider);
                    // Filtrado por prioridad
                    final tareasFiltradas = selectedPrioridad == 'Todas'
                        ? tareaEjemplo
                        : tareaEjemplo
                              .where(
                                (t) =>
                                    (t.prioridad ?? '').toLowerCase() ==
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
            tareas: tareasIniciales.length.toString(), // 👈 corregido
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
