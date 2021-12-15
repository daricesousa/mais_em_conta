import 'package:flutter/material.dart';
import 'package:mais_em_conta/enumRadio.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/Custom/textos.dart';

class MaisDetalhesController extends ChangeNotifier{
  double novoPrecoA = 0;
  double novoPrecoB = 0;
  double diferenca = 0;
  String economiza = '';
  PesosRadio? pesoEscolhido;

  Peso _peso = Peso.peso;
  Preco _preco = Preco.preco;

  void calcularNovosPrecos(double pesoMain) {
    novoPrecoA = regraDeTres(_peso.A!, _preco.A, pesoMain);
    novoPrecoB = regraDeTres(_peso.B!, _preco.B, pesoMain);
    if (novoPrecoA > novoPrecoB) {
      diferenca = novoPrecoA - novoPrecoB;
      economiza = Texto.economiza(Titulo.titulo.B, diferenca);
    } else if (novoPrecoB > novoPrecoA) {
      diferenca = novoPrecoB - novoPrecoA;
      economiza = Texto.economiza(Titulo.titulo.A, diferenca);
    }
    notifyListeners();
  }

  void preencherCards(double pesoMain) {
    TextController.maisDetalhesA.preco.text = novoPrecoA.toStringAsFixed(2);
    TextController.maisDetalhesA.peso.text = pesoMain.toString();
    TextController.maisDetalhesB.preco.text = novoPrecoB.toStringAsFixed(2);
    TextController.maisDetalhesB.peso.text = pesoMain.toString();
    TextController.maisDetalhesA.titulo = TextController.A.titulo;
    TextController.maisDetalhesB.titulo = TextController.B.titulo;
    notifyListeners();
  }

  double regraDeTres(double valor1, double valor2, double valor3) {
    return (valor3 * valor2) / valor1;
  }
}
