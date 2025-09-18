import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prueba/infrastucture/db/isar/collections/tarea.dart';

class LocalDatabaseHelper {
  static Isar? _isar;
  static final LocalDatabaseHelper db = LocalDatabaseHelper._();
  LocalDatabaseHelper._();

  Future<Isar> get isar async {
    if (_isar != null) return _isar!;
    _isar = await initDB();

    return _isar!;
  }

  Future<Isar> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([TareaCollectionSchema], directory: dir.path);
  }
}
