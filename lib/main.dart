// main.dart
import 'package:flutter/material.dart';
import 'package:perguntas/questionario.dart';
import 'package:perguntas/resultado.dart';

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
  var _pontuacaoTotal = 0;

  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontos': 10},
        {'texto': 'Vermelho', 'pontos': 5},
        {'texto': 'Verde', 'pontos': 3},
        {'texto': 'Branco', 'pontos': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontos': 10},
        {'texto': 'Cobra', 'pontos': 5},
        {'texto': 'Elefante', 'pontos': 3},
        {'texto': 'Leão', 'pontos': 1},
      ],
    },
    {
      'texto': 'Qual é o seu carro favorito?',
      'respostas': [
        {'texto': 'Jeep', 'pontos': 10},
        {'texto': 'BMW', 'pontos': 5},
        {'texto': 'Nissan', 'pontos': 3},
        {'texto': 'Ford', 'pontos': 1},
      ],
    }
  ];

  void _responder(int potuacao) {
    if (temPerguntaSelecinada)
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += potuacao;
      });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  /* 
  * Aqui é um exemplo de propriedade somente leitura.
  */
  bool get temPerguntaSelecinada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecinada
            ? Questinario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(
                _pontuacaoTotal,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}
