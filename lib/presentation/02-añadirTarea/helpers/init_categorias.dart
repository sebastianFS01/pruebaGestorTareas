


import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;
import 'package:prueba/configuration/providers/riverpod/tareas/tareas_riverpod.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/datasource/local_database_datasource_impl.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/repository/local_database_repository_impl.dart';

Future initCategorias(BuildContext context, WidgetRef ref) async {
  final datasource = LocalDatabaseDatasourceImpl();
  final repository = LocalDatabaseRepositoryImpl(datasource: datasource);
  final res = await repository.traerCategorias();

  ref.read(categoriasProvider.notifier).update((state) => res);
}
