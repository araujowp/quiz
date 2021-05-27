import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/pergunta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Perguntas {

  int _perguntaAtual = 0;

  List<Pergunta> _listaPerguntas  = [
    Pergunta('Mel não apodrece', true),
    Pergunta('Frankenstein era o nome do criador, e não o monstro.', true),
    Pergunta('A palavra “saudade” é intraduzível', false),
    // Pergunta('Existem 10 vezes mais bactérias no corpo humano que células propriamente ditas', true),
    // Pergunta('Em Saturno e Júpiter, a chuva é feita de diamantes.', true),
    // Pergunta('Esquimós têm mais de 100 termos para neve', false),
    // Pergunta('O polvo tem três corações.', true),
    // Pergunta('Tomar vacina causa gripe', false),
    // Pergunta('Usamos menos de 20% do cerebro', false),
    // Pergunta('Açucar deixa crianças hiperativas', false),
    // Pergunta('Para cada pessoa no mundo existem cerca de 1,6 milhões de formigas.', true),
    // Pergunta('Chiclete fica 7 anos no estomago', false),
    // Pergunta('Estalar os dedos causa artrite', false),
    // Pergunta('Vacas conseguem subir escadas, mas não conseguem descer', true),
    // Pergunta('A Terra tem apenas sete mares', false),
    // Pergunta('Desapareceu? Espere 24h até fazer B.O.', false),
    // Pergunta('A Amazônia é o pulmão do mundo', false),
    // Pergunta('Um lápis pode escrever uma linha reta de até 56 km', true),
    // Pergunta('O Monte Everest cresce 4 milímetros por ano', true),
    // Pergunta('A velocidade de rotação da Terra é de 1674.4 km/h',true),
  ];

  proxima(){
    if(_perguntaAtual < _listaPerguntas.length -1){
      _perguntaAtual++;
    }else {
      print('opa acabou a lista');
    }
  }

  List<Pergunta> get todas  {
   return _listaPerguntas;
  }

  Pergunta getPergunta(){
    return _listaPerguntas[_perguntaAtual];
  }
}

