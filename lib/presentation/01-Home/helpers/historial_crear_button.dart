import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/providers/riverpod/historial/historial_riverpod.dart';
import 'package:prueba/domain/models/historial.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/datasource/local_database_datasource_impl.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/repository/local_database_repository_impl.dart';

crearHistorialTarea(WidgetRef ref, Historial historial) {
  final datasource = LocalDatabaseDatasourceImpl();
  final repository = LocalDatabaseRepositoryImpl(datasource: datasource);
  repository.nuevoHistorial(historial);
  final rivHistorial = ref.read(historialProvider.notifier).state;
  ref.read(historialProvider.notifier).state = [...rivHistorial, historial];
  
}
