import 'package:isar/isar.dart';

part 'tarea.g.dart';

@collection
class TareaCollection {
  Id id = Isar.autoIncrement;
  String? title;
  String? description;
  String? estado;
  String? prioridad;
  List<String>? categoria;
  int? valorPuntos;
}