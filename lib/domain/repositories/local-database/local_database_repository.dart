
import 'package:prueba/domain/models/tarea.dart';

abstract class LocalDatabaseRepository{
  Future nuevaTarea(Tarea tarea);
}