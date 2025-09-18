import 'package:isar/isar.dart';

part 'categorias.g.dart';

@collection
class CategoriasCollection {
  Id id = Isar.autoIncrement;
  String? name;
}