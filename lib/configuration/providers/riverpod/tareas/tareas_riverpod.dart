import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/domain/models/tarea.dart';

final tareaProvider = StateProvider<List<Tarea>>((ref) {
  return [];
});

class TareaFormProvider extends StateNotifier<TareaState>{
  
  TareaFormProvider():super(TareaState(formKey: GlobalKey<FormState>()));


 bool validarFormulario() {
    final form = state.formKey.currentState;
    return form?.validate() ?? false;
  }

}

class TareaState {
  final GlobalKey<FormState> formKey;
  final Tarea? tarea;

  TareaState({
    required this.formKey,
    this.tarea,
  });

  TareaState copyWith({Tarea? tarea}) {
    return TareaState(
      formKey: formKey, 
      tarea: tarea ?? this.tarea,
    );
  }
}

