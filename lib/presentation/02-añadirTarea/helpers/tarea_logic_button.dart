import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart';
import 'package:prueba/domain/models/tarea.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/datasource/local_database_datasource_impl.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/repository/local_database_repository_impl.dart';



pressButtonCrear(BuildContext context, WidgetRef ref, Tarea tarea) {
  final datasource = LocalDatabaseDatasourceImpl();
  final repository = LocalDatabaseRepositoryImpl(datasource: datasource);
  repository.nuevaTarea(tarea);
  ref.read(tareaProvider.notifier).state.add(tarea);
}
