import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/textos.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/text_controller.dart';
import 'package:mais_em_conta/controllers.dart/validacoes.dart';
import 'package:mais_em_conta/enum_campo.dart';

class RegraDeTresControl extends ChangeNotifier {
  String? erro;
  final _textController = TextController.regraDeTres;

  void iniciarCards() {
    _copiarCard(_textController.A, TextController.maisEmConta.A);
    _copiarCard(_textController.B, TextController.maisEmConta.B);
    _preencherTitulos();
    double? precoA = Converter.reaisParaDouble(_textController.A.preco.text);
    if (precoA == 0) {
      _textController.A.preco.clear();
    }
    double? precoB = Converter.reaisParaDouble(_textController.B.preco.text);
    if (precoB == 0) {
      _textController.B.preco.clear();
    }
  }

  void _preencherTitulos() {
    if (_textController.A.titulo.text.isEmpty) {
      _textController.A.titulo.text = 'Produto A';
    }

    if (_textController.B.titulo.text == '') {
      _textController.B.titulo.text = 'Produto B';
    }
  }

  void _copiarCard(
      ControllerCard controllerCard1, ControllerCard controllerCard2) {
    controllerCard1.peso.text = controllerCard2.peso.text;
    controllerCard1.preco.text = controllerCard2.preco.text;
    controllerCard1.titulo.text = controllerCard2.titulo.text;
  }

  String? validar() {
    Campo pesoA = _validacoes(Validacao.peso(_textController.A.peso.text));
    Campo pesoB = _validacoes(Validacao.peso(_textController.B.peso.text));
    Campo precoA = _validacoes(Validacao.preco(_textController.A.preco.text));
    Campo precoB = _validacoes(Validacao.preco(_textController.B.preco.text));

    int produto = _validarcampos(pesoA, 2) *
        _validarcampos(pesoB, 3) *
        _validarcampos(precoA, 5) *
        _validarcampos(precoB, 7);
    if (produto == 1) {
      erro = Erro.campoVazioFaltando;
    } else if (produto == 0) {
      erro = Erro.campoIncorreto;
    } else if (produto != 2 && produto != 3 && produto != 5 && produto != 7) {
      erro = Erro.campoVazioRegraDeTres;
    } else {
      _chamarCalcular(produto);
    }
    notifyListeners();
  }

  void _chamarCalcular(int produto) {
    erro = '';
    _preencherTitulos();
    double? precoA, precoB, pesoA, pesoB;

    pesoA = Converter.stringParaDouble(_textController.A.peso.text);
    pesoB = Converter.stringParaDouble(_textController.B.peso.text);
    precoA = Converter.reaisParaDouble(_textController.A.preco.text);
    precoB = Converter.reaisParaDouble(_textController.B.preco.text);

    if (produto == 2) {
      double valor = _regraDeTres(pesoB!, precoA!, precoB!);
      _textController.A.peso.text = valor.toStringAsFixed(2);
    }
    if (produto == 3) {
      double valor = _regraDeTres(pesoA!, precoB!, precoA!);
      _textController.B.peso.text = valor.toStringAsFixed(2);
    }
    if (produto == 5) {
      double valor = _regraDeTres(precoB!, pesoA!, pesoB!);
      _textController.A.preco.text =
          Converter.doubleParaTextControllerPreco(valor);
    }
    if (produto == 7) {
      double valor = _regraDeTres(precoA!, pesoB!, pesoA!);
      _textController.B.preco.text =
          Converter.doubleParaTextControllerPreco(valor);
    }

    notifyListeners();
  }

   void limparCampos(){
    _textController.A.titulo.text = 'Produto A';
     _textController.B.titulo.text = 'Produto B';
     _textController.A.peso.text = '';
     _textController.B.peso.text = '';
     _textController.A.preco.text = '';
     _textController.B.preco.text = '';
     erro = '';
     notifyListeners();
  }

  double _regraDeTres(double mult1, double mult2, double div) {
    return (mult1 * mult2) / div;
  }

  Campo _validacoes(String? validacao) {
    String? erro = validacao;
    if (erro == null) return Campo.ok;
    if (erro == Erro.campoVazio) {
      return Campo.vazio;
    } else {
      return Campo.incorreto;
    }
  }

  int _validarcampos(Campo validacao, int posicao) {
    if (validacao == Campo.incorreto) return 0;
    if (validacao == Campo.ok) return 1;
    if (validacao == Campo.vazio) return posicao;
    return 0;
  }
}
