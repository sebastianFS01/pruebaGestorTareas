import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart';
import 'package:prueba/presentation/02-a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/03-Historial/screen/historial_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/user_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/constants/responsive.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/presentation/01-Home/helpers/init_data_helper.dart';
import '../widgets/home_header.dart';
import '../widgets/home_state_category_buttons.dart';
import '../widgets/home_task_example_card.dart';
import '../widgets/category_filter_chips.dart';
import '../widgets/home_add_task_button.dart';
import '../widgets/home_bottom_navigation.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final route = 'home';
  HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String? userName;

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

  // Simulación de lista de tareas (reemplaza por tu lista real)
  late final List<Tarea> tareas = [
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

  int calcularPuntosTotales() {
    int total = 0;
    for (var tarea in tareas) {
      switch (tarea.prioridad.toLowerCase()) {
        case 'alta':
          total += 50;
          break;
        case 'media':
          total += 20;
          break;
        case 'baja':
          total += 10;
          break;
        default:
          total += tarea.valorPuntos;
      }
    }
    return total;
  }

  int calcularNivel(int puntos) {
    if (puntos < 100) return 1;
    if (puntos < 250) return 2;
    if (puntos < 500) return 3;
    if (puntos < 1000) return 4;
    if (puntos < 2000) return 5;
    return 6 + ((puntos - 2000) ~/ 1000);
  }

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
  Widget build(BuildContext context) {
    final puntos = calcularPuntosTotales();
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
              Consumer(
                builder: (context, ref, child) {
                  final tareaEjemplo = ref.watch(tareaProvider);
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        // Aquí podrías filtrar las tareas por estado/categoría si tuvieras una lista
                        return Column(
                          children: [
                            HomeTaskExampleCard(tarea: tareaEjemplo[index]),
                          ],
                        );
                      },
                      itemCount: tareaEjemplo.length,
                    ),
                  );
                },
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
            // Si HomeBottomNavigation espera un String, puedes pasar tareas.length.toString() o similar
            tareas: tareas.length.toString(),
            historial: historial,
            onTareasPressed: () {},
            onHistorialPressed: () {
              Navigator.pushNamed(context, HistorialScreen().route);
            },
          ),
        ),
      ),
    );
  }
}
