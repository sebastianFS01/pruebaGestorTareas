
import 'package:prueba/domain/models/tarea.dart';

abstract class LocalDatabaseRepository{
  Future<int> nuevaTarea(Tarea tarea);
}