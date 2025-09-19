// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historial.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHistorialCollectionCollection on Isar {
  IsarCollection<HistorialCollection> get historialCollections =>
      this.collection();
}

const HistorialCollectionSchema = CollectionSchema(
  name: r'HistorialCollection',
  id: 2024064194761075374,
  properties: {
    r'fechaFinalizacion': PropertySchema(
      id: 0,
      name: r'fechaFinalizacion',
      type: IsarType.dateTime,
    ),
    r'puntosObtenidos': PropertySchema(
      id: 1,
      name: r'puntosObtenidos',
      type: IsarType.long,
    ),
    r'titulo': PropertySchema(
      id: 2,
      name: r'titulo',
      type: IsarType.string,
    )
  },
  estimateSize: _historialCollectionEstimateSize,
  serialize: _historialCollectionSerialize,
  deserialize: _historialCollectionDeserialize,
  deserializeProp: _historialCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _historialCollectionGetId,
  getLinks: _historialCollectionGetLinks,
  attach: _historialCollectionAttach,
  version: '3.1.0+1',
);

int _historialCollectionEstimateSize(
  HistorialCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.titulo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _historialCollectionSerialize(
  HistorialCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fechaFinalizacion);
  writer.writeLong(offsets[1], object.puntosObtenidos);
  writer.writeString(offsets[2], object.titulo);
}

HistorialCollection _historialCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HistorialCollection();
  object.fechaFinalizacion = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.puntosObtenidos = reader.readLongOrNull(offsets[1]);
  object.titulo = reader.readStringOrNull(offsets[2]);
  return object;
}

P _historialCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _historialCollectionGetId(HistorialCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _historialCollectionGetLinks(
    HistorialCollection object) {
  return [];
}

void _historialCollectionAttach(
    IsarCollection<dynamic> col, Id id, HistorialCollection object) {
  object.id = id;
}

extension HistorialCollectionQueryWhereSort
    on QueryBuilder<HistorialCollection, HistorialCollection, QWhere> {
  QueryBuilder<HistorialCollection, HistorialCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HistorialCollectionQueryWhere
    on QueryBuilder<HistorialCollection, HistorialCollection, QWhereClause> {
  QueryBuilder<HistorialCollection, HistorialCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HistorialCollectionQueryFilter on QueryBuilder<HistorialCollection,
    HistorialCollection, QFilterCondition> {
  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      fechaFinalizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaFinalizacion',
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      fechaFinalizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaFinalizacion',
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      fechaFinalizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFinalizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      fechaFinalizacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFinalizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      fechaFinalizacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFinalizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      fechaFinalizacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFinalizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      puntosObtenidosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'puntosObtenidos',
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      puntosObtenidosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'puntosObtenidos',
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      puntosObtenidosEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puntosObtenidos',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      puntosObtenidosGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'puntosObtenidos',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      puntosObtenidosLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'puntosObtenidos',
        value: value,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      puntosObtenidosBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'puntosObtenidos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'titulo',
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'titulo',
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titulo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterFilterCondition>
      tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titulo',
        value: '',
      ));
    });
  }
}

extension HistorialCollectionQueryObject on QueryBuilder<HistorialCollection,
    HistorialCollection, QFilterCondition> {}

extension HistorialCollectionQueryLinks on QueryBuilder<HistorialCollection,
    HistorialCollection, QFilterCondition> {}

extension HistorialCollectionQuerySortBy
    on QueryBuilder<HistorialCollection, HistorialCollection, QSortBy> {
  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      sortByFechaFinalizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFinalizacion', Sort.asc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      sortByFechaFinalizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFinalizacion', Sort.desc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      sortByPuntosObtenidos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puntosObtenidos', Sort.asc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      sortByPuntosObtenidosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puntosObtenidos', Sort.desc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension HistorialCollectionQuerySortThenBy
    on QueryBuilder<HistorialCollection, HistorialCollection, QSortThenBy> {
  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenByFechaFinalizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFinalizacion', Sort.asc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenByFechaFinalizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFinalizacion', Sort.desc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenByPuntosObtenidos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puntosObtenidos', Sort.asc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenByPuntosObtenidosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puntosObtenidos', Sort.desc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QAfterSortBy>
      thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension HistorialCollectionQueryWhereDistinct
    on QueryBuilder<HistorialCollection, HistorialCollection, QDistinct> {
  QueryBuilder<HistorialCollection, HistorialCollection, QDistinct>
      distinctByFechaFinalizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFinalizacion');
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QDistinct>
      distinctByPuntosObtenidos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puntosObtenidos');
    });
  }

  QueryBuilder<HistorialCollection, HistorialCollection, QDistinct>
      distinctByTitulo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }
}

extension HistorialCollectionQueryProperty
    on QueryBuilder<HistorialCollection, HistorialCollection, QQueryProperty> {
  QueryBuilder<HistorialCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HistorialCollection, DateTime?, QQueryOperations>
      fechaFinalizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFinalizacion');
    });
  }

  QueryBuilder<HistorialCollection, int?, QQueryOperations>
      puntosObtenidosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puntosObtenidos');
    });
  }

  QueryBuilder<HistorialCollection, String?, QQueryOperations>
      tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }
}
