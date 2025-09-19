

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/domain/models/historial.dart';

final historialProvider = StateProvider<List<Historial>>((ref) {
  return [];
});
