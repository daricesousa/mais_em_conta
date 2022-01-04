import 'package:flutter/material.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/text_controller.dart';
import 'package:mais_em_conta/enum_radio.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/Custom/textos.dart';

class MaisDetalhesController extends ChangeNotifier {
  double novoPrecoA = 0;
  double novoPrecoB = 0;
  double diferenca = 0;
  String economiza = '';
  PesosRadio? pesoEscolhido;

  final _peso = Peso.peso;
  final _preco = Preco.preco;

  void calcularNovosPrecos(double pesoMain) {
    novoPrecoA = _regraDeTres(_peso.A!, _preco.A, pesoMain);
    novoPrecoB = _regraDeTres(_peso.B!, _preco.B, pesoMain);
    if (novoPrecoA > novoPrecoB) {
      diferenca = novoPrecoA - novoPrecoB;
      economiza = Texto.economiza(Titulo.titulo.B, diferenca);
    } else if (novoPrecoB > novoPrecoA) {
      diferenca = novoPrecoB - novoPrecoA;
      economiza = Texto.economiza(Titulo.titulo.A, diferenca);
    }
    else{
      economiza = Texto.mesmoCusto;
    }
      notifyListeners();

  }

  void preencherCards(double pesoMain) {
    TextController.maisDetalhes.B.preco.text = Converter.doubleParaTextControllerPreco(novoPrecoB);
    TextController.maisDetalhes.A.preco.text = Converter.doubleParaTextControllerPreco(novoPrecoA);
    TextController.maisDetalhes.A.peso.text = pesoMain.toString();
    TextController.maisDetalhes.B.peso.text = pesoMain.toString();
    TextController.maisDetalhes.A.titulo.text = TextController.maisEmConta.A.titulo.text;
    TextController.maisDetalhes.B.titulo.text = TextController.maisEmConta.B.titulo.text;
      notifyListeners();
  }

  double _regraDeTres(double valor1, double valor2, double valor3) {
    return (valor3 * valor2) / valor1;
  }
}
