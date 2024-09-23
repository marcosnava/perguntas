// main.dart
import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual é o seu carro favorito?',
      'respostas': ['Jeep', 'BMW', 'Nissan', 'Ford']
    }
  ];

  void _responder() {
    if (_perguntaSelecionada < (perguntas.length - 1))
      setState(() {
        _perguntaSelecionada++;
      });
    else
      setState(() {
        _perguntaSelecionada = 0;
      });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        perguntas[_perguntaSelecionada]['respostas'] as List<String>;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(texto: perguntas[_perguntaSelecionada]['texto'] as String),
            ...respostas.map((r) => Resposta(r, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}
