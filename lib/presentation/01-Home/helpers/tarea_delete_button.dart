

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/datasource/local_database_datasource_impl.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/repository/local_database_repository_impl.dart';

pressButtonEliminar(BuildContext context, WidgetRef ref, int id) {
  final datasource = LocalDatabaseDatasourceImpl();
  final repository = LocalDatabaseRepositoryImpl(datasource: datasource);
  repository.eliminarTarea(id);
  ref.read(tareaProvider.notifier).state = ref.read(tareaProvider.notifier).state.where((it) => it.id != id).toList();
}
