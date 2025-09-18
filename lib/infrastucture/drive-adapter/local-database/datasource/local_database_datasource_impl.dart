import 'package:isar/isar.dart';
import 'package:prueba/domain/datasourcers/local-database/local_database_dataresource.dart';
import 'package:prueba/domain/models/categorias.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/infrastucture/db/isar/collections/categorias.dart';
import 'package:prueba/infrastucture/db/isar/helpers/adapters/tareaAdapter.dart';
import 'package:prueba/infrastucture/db/isar/local_database_helper.dart';
import 'package:prueba/infrastucture/db/isar/queries/local_database_categorias.dart';
import 'package:prueba/infrastucture/db/isar/queries/local_database_tareas.dart';

class LocalDatabaseDatasourceImpl implements LocalDatabaseDataresource {
  final Future<Isar> _isarFuture = LocalDatabaseHelper.db.isar;

  @override
  Future nuevaTarea(Tarea tarea) async {
    final db = await _isarFuture;
    final nuevaTarea = TareaAdapter.toEntity(tarea);
    await LocalDatabaseTareas(
      isar: db,
    ).guardarOcrearTarea(nuevaTarea);
  }

  @override
  Future<List<Tarea>> traerTareas() async {
    final db = await _isarFuture;
    final tareas = await LocalDatabaseTareas(isar: db).traerTareas();
    return tareas.map((it) => TareaAdapter.toDomain(it)).toList();
  }
  
  @override
  Future<bool> eliminarTarea(int id) async {
    final db = await _isarFuture;
    return await LocalDatabaseTareas(isar: db).eliminarTarea(id); 
  }
  
  @override
  Future<bool> eliminarCategoria(int id) async {
    final db = await _isarFuture;
    return await LocalDatabaseCategorias(isar: db).eliminarCategoria(id);
  }
  
  @override
  Future nuevaCategoria(Categorias categoria)async  {
   final db = await _isarFuture;
    final nuevaCategoria = CategoriasCollection()..name;
    await LocalDatabaseCategorias(
      isar: db,
    ).guardarOcrearCategoria(nuevaCategoria);
  }
  
  @override
  Future<List<Categorias>> traerCategorias() async {
     final db = await _isarFuture;
    final categorias = await LocalDatabaseCategorias(isar: db).traerCategorias();
    return categorias.map((it) => Categorias(name: it.name!, id: it.id)).toList();
  }
}
