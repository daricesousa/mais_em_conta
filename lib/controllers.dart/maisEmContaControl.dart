import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/Custom/textos.dart';
import 'package:mais_em_conta/controllers.dart/validacoes.dart';

class MaisEmContaControl extends ChangeNotifier {

  Peso _peso = Peso.peso;
  Preco _preco = Preco.preco;
  Titulo _titulo = Titulo.titulo;

  String maisEconomico = '';
  bool calculado = false;
  String? erro;



  void chamarCalcular() {
    maisEconomico = '';
    calculado = false;
    if (_validacoes(Validacao.peso(TextController.A.peso.text)) &&
        _validacoes(Validacao.peso(TextController.B.peso.text)) &&
        _validacoes(Validacao.preco(TextController.A.preco.text)) &&
        _validacoes(Validacao.preco(TextController.B.preco.text))) {
      _definirVariaveis();
      _calcular();
    }

    notifyListeners();
  }

  void _definirVariaveis() {
    calculado = true;
    _peso.A = Converter.stringParaDouble(TextController.A.peso.text);
    _peso.B = Converter.stringParaDouble(TextController.B.peso.text);
    _preco.A = Converter.reaisParaDouble(TextController.A.preco.text);
    _preco.B = Converter.reaisParaDouble(TextController.B.preco.text);

    if (TextController.A.titulo.text != '')
      _titulo.A = TextController.A.titulo.text;
    if (TextController.B.titulo.text != '')
      _titulo.B = TextController.B.titulo.text;
  }

  void _calcular() {
    double a = double.parse((_peso.A! / _preco.A).toStringAsFixed(2));
    double b = double.parse((_peso.B! / _preco.B).toStringAsFixed(2));
    if (a > b) {
      maisEconomico = Texto.produtoMaisEconomico(_titulo.A);
    } else if (a < b) {
      maisEconomico = Texto.produtoMaisEconomico(_titulo.B);
    } else {
      maisEconomico = Texto.mesmoCusto;
    }
    notifyListeners();
  }

  bool _validacoes(String? validacao) {
    erro = validacao;
    if (erro == null) {
      return true;
    } else {
      return false;
    }
  }
}
