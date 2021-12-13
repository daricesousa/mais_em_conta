import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/enumRadio.dart';
import 'package:mais_em_conta/controllers.dart/maisDetalhesControl.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/textos.dart';
import 'package:mais_em_conta/validacoes.dart';

class MaisEmContaControl extends ChangeNotifier {

PesosRadio? pesoEscolhido;

  Peso _peso = Peso.peso;
  Preco _preco = Preco.preco;
  Titulo _titulo = Titulo.titulo;

  String maisEconomico = '';
  bool calculado = false;
  final controllerMaisDetalhes = MaisDetalhesController();
  String? erro;

  void calcularNovosPrecos(double pesoMain){
    controllerMaisDetalhes.calcularNovosPrecos(pesoMain);
    notifyListeners();
  }

   void preencherCards(double pesoMain){
    controllerMaisDetalhes.preencherCards(pesoMain);
    notifyListeners();
  }

  void prencherPrecos() {
    double value = 0;
    final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");
    String newText = formatter.format(value / 100);
    TextController.A.preco.value = TextController.A.preco.value.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
    TextController.B.preco.value = TextController.B.preco.value.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }

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
    pesoEscolhido = null;
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
