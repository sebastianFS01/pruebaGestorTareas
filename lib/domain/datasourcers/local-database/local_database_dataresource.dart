

import 'package:prueba/domain/models/tarea.dart';

abstract class LocalDatabaseDataresource{
  Future nuevaTarea(Tarea tarea);
}