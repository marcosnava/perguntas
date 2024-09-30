// questionario.dart
import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questinario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questinario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecinada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecinada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((r) {
          return Resposta(
            r['texto'] as String,
            () => quandoResponder(r['pontos'] as int),
          );
        }).toList(),
      ],
    );
  }
}
