

import 'package:prueba/domain/models/tarea.dart';

abstract class LocalDatabaseDataresource{
  Future<int> nuevaTarea(Tarea tarea);
}