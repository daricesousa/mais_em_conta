import 'package:flutter/widgets.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/Custom/textos.dart';
import 'package:mais_em_conta/controllers.dart/validacoes.dart';

class MaisEmContaControl extends ChangeNotifier {
  Peso _peso = Peso.peso;
  Preco _preco = Preco.preco;
  Titulo _titulo = Titulo.titulo;
  final _textController = TextController.maisEmConta;

  String maisEconomico = '';
  bool calculado = false;
  String? erro;

  void iniciarCards() {
    _copiarCard(_textController.A, TextController.regraDeTres.A);
    _copiarCard(_textController.B, TextController.regraDeTres.B);
    _preencherTitulos();

    double? precoA = Converter.reaisParaDouble(_textController.A.preco.text);
    double? precoB = Converter.reaisParaDouble(_textController.B.preco.text);
    if(precoA == null || precoA == 0){
      _textController.A.preco.text = Converter.doubleParaTextControllerPreco(0);
    }
    if(precoB == null || precoB == 0){
      _textController.B.preco.text = Converter.doubleParaTextControllerPreco(0);
    }
  }

  void limparCampos(){
    _textController.A.titulo.text = 'Produto A';
     _textController.B.titulo.text = 'Produto B';
     _textController.A.peso.text = '';
     _textController.B.peso.text = '';
     _textController.A.preco.text = Converter.doubleParaTextControllerPreco(0);
     _textController.B.preco.text = Converter.doubleParaTextControllerPreco(0);
     erro = '';
     calculado = false;
     notifyListeners();

  }


  void _preencherTitulos() {
    if (_textController.A.titulo.text.isEmpty) {
      _textController.A.titulo.text = 'Produto A';
    }

    if (_textController.B.titulo.text == '') {
      _textController.B.titulo.text = 'Produto B';
    }
  }


  void _copiarCard(ControllerCard controllerCard1, ControllerCard controllerCard2){
    controllerCard1.peso.text = controllerCard2.peso.text;
    controllerCard1.preco.text = controllerCard2.preco.text;
    controllerCard1.titulo.text = controllerCard2.titulo.text;
  }

  void chamarCalcular() {
    maisEconomico = '';
    calculado = false;
    if (_validacoes(Validacao.peso(_textController.A.peso.text)) &&
        _validacoes(Validacao.peso(_textController.B.peso.text)) &&
        _validacoes(Validacao.preco(_textController.A.preco.text)) &&
        _validacoes(Validacao.preco(_textController.B.preco.text))) {
      _definirVariaveis();
      _calcular();
    }

    
      notifyListeners();
  
  }

  void _definirVariaveis() {
    calculado = true;
    _peso.A = Converter.stringParaDouble(_textController.A.peso.text);
    _peso.B = Converter.stringParaDouble(_textController.B.peso.text);
    _preco.A = Converter.reaisParaDouble(_textController.A.preco.text)!;
    _preco.B = Converter.reaisParaDouble(_textController.B.preco.text)!;

    if (_textController.A.titulo.text != '')
      _titulo.A = _textController.A.titulo.text;
    if (_textController.B.titulo.text != '')
      _titulo.B = _textController.B.titulo.text;
  }

  void _calcular() {
    _preencherTitulos();
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
