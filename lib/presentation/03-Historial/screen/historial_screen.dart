import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/configuration/providers/riverpod/historial/historial_riverpod.dart';
import 'package:prueba/presentation/03-Historial/helpers/init_historial.dart';
import '../widgets/historial_nota_tile.dart';

class HistorialScreen extends ConsumerStatefulWidget {
  static const String route = 'historialScreen';

  const HistorialScreen({super.key});

   @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistorialScreenState();
}
    
 

class _HistorialScreenState extends ConsumerState<HistorialScreen> {

  @override
  void initState() {
    super.initState();
    initHistorial(context, ref);
  }

  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (context, ref, child) {
        final historialNotas = ref.watch(historialProvider);
        return Scaffold(
        backgroundColor: const Color(0xFFF6F8FC),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2D3142),
          title: const Text(
            'Historial de Tareas',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.separated(
            itemCount: historialNotas.length,
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final nota = historialNotas[index];
              return HistorialNotaTile(
                titulo: nota.titulo,
                puntosObtenidos: nota.puntosObtenidos,
                fecha: nota.fechaFinalizacion,
              );
            },
          ),
        ),
      );
      }
    );
  }
}

