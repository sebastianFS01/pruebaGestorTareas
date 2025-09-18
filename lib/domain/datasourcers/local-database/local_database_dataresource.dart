

import 'package:prueba/domain/models/tarea.dart';

abstract class LocalDatabaseDataresource{
  Future nuevaTarea(Tarea tarea);
  Future <List<Tarea>> traerTareas();
  Future <bool> eliminarTarea();
}