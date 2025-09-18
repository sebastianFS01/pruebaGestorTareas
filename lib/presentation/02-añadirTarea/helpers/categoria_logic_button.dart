import 'package:prueba/domain/models/categorias.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/datasource/local_database_datasource_impl.dart';
import 'package:prueba/infrastucture/drive-adapter/local-database/repository/local_database_repository_impl.dart';

pressButtonCrearCategoria(Categorias categoria) {
  final datasource = LocalDatabaseDatasourceImpl();
  final repository = LocalDatabaseRepositoryImpl(datasource: datasource);
  repository.nuevaCategoria(categoria);
}


pressButtonBorrarCategoria(int id) {
  final datasource = LocalDatabaseDatasourceImpl();
  final repository = LocalDatabaseRepositoryImpl(datasource: datasource);
  repository.eliminarCategoria(id);
}



