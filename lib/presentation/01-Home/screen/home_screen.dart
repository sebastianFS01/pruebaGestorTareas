import 'package:intl/intl.dart';
import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart'
    hide categoriasProvider;
import 'package:prueba/domain/models/historial.dart';
import 'package:prueba/presentation/01-Home/helpers/historial_crear_button.dart';
// import eliminado: categorias_riverpod.dart (ya no se usa)
import 'package:prueba/presentation/01-Home/helpers/points_level_helper.dart';
import 'package:prueba/infrastucture/db/isar/local_database_helper.dart';
import 'package:prueba/infrastucture/db/isar/queries/local_database_tareas.dart';
import 'package:prueba/infrastucture/db/isar/collections/tarea.dart';
import 'package:prueba/presentation/02-a%C3%B1adirTarea/screen/tarea_screen.dart';
import 'package:prueba/presentation/03-Historial/screen/historial_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/user_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/constants/responsive.dart';

import 'package:prueba/presentation/01-Home/helpers/init_tareas_helper.dart';
import '../widgets/home_header.dart';
import '../widgets/home_state_category_buttons.dart';
import '../widgets/home_task_example_card.dart';
import 'package:prueba/domain/models/tarea.dart';
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
  Future<void> _completarTareaEnDB(Tarea tarea) async {
    final isar = await LocalDatabaseHelper.db.isar;
    final db = LocalDatabaseTareas(isar: isar);
    final tareaActualizada = TareaCollection()
      ..id = tarea.id ?? 0
      ..title = tarea.title
      ..description = tarea.description
      ..estado = '✅ Hecho'
      ..prioridad = tarea.prioridad
      ..valorPuntos = tarea.valorPuntos
      ..categoria = tarea.categoria;
    await db.guardarOcrearTarea(tareaActualizada);
  }

  Future<void> _eliminarTareaEnDB(int? id) async {
    if (id == null) return;
    final isar = await LocalDatabaseHelper.db.isar;
    final db = LocalDatabaseTareas(isar: isar);
    await db.eliminarTarea(id);
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      onCategoriaPressed: null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 140, 
                    child: DropdownButton<String>(
                      underline: Container(color: Colors.white,),
                      isExpanded: true, 
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
                    // Filtrar por estado y prioridad
                    final tareasFiltradas = tareaList
                        .where(
                          (t) => t.estado.toLowerCase().contains(
                            selectedEstado.toLowerCase(),
                          ),
                        )
                        .where(
                          (t) =>
                              selectedPrioridad == 'Todas' ||
                              t.prioridad.toLowerCase() ==
                                  selectedPrioridad.toLowerCase(),
                        )
                        .toList();
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final tarea = tareasFiltradas[index];
                        return Dismissible(
                          key: ValueKey(
                            tarea.id ?? tarea.title + tarea.description,
                          ),
                          background: Container(
                            color: Colors.green,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 24),
                            child: const Row(
                              children: [
                                Icon(Icons.check, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Completar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 24),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.delete, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              // Swipe izquierda: eliminar con confirmación
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('¿Eliminar tarea?'),
                                  content: const Text(
                                    '¿Estás seguro de que deseas eliminar esta tarea? Esta acción no se puede deshacer.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text(
                                        'Eliminar',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                // Eliminar tarea del provider y base de datos aquí
                                final tareas = [...ref.read(tareaProvider)];
                                tareas.removeWhere((t) => t.id == tarea.id);
                                ref.read(tareaProvider.notifier).state = tareas;
                                await _eliminarTareaEnDB(tarea.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Tarea eliminada'),
                                  ),
                                );
                                return true;
                              }
                              return false;
                            } else if (direction ==
                                DismissDirection.startToEnd) {
                              DateTime fechaActual = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
                              // Swipe derecha: completar tarea
                              crearHistorialTarea(ref, 
                              Historial(
                                puntosObtenidos: tarea.valorPuntos, 
                                titulo: tarea.title, 
                                fechaFinalizacion: fechaActual));
                              if (tarea.estado == '✅ Hecho') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'La tarea ya está completada',
                                    ),
                                  ),
                                );
                                return false;
                              }
                              final tareas = [...ref.read(tareaProvider)];
                              final idx = tareas.indexWhere(
                                (t) => t.id == tarea.id,
                              );
                              if (idx != -1) {
                                tareas[idx] = Tarea(
                                  id: tarea.id,
                                  title: tarea.title,
                                  description: tarea.description,
                                  estado: '✅ Hecho',
                                  prioridad: tarea.prioridad,
                                  valorPuntos: tarea.valorPuntos,
                                  categoria: tarea.categoria,
                                );
                                ref.read(tareaProvider.notifier).state = tareas;
                                await _completarTareaEnDB(tarea);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '¡Tarea completada! +${tarea.valorPuntos} puntos',
                                    ),
                                  ),
                                );
                              }
                              return false; // No eliminar de la lista visualmente
                            }
                            return false;
                          },
                          child: HomeTaskExampleCard(tarea: tarea),
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
