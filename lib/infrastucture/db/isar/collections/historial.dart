import 'package:isar/isar.dart';
part 'historial.g.dart';


@collection
class HistorialCollection{
  Id id = Isar.autoIncrement;
  String? titulo;
  DateTime? fechaFinalizacion;
  int? puntosObtenidos;
}