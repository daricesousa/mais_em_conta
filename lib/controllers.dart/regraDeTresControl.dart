import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/textos.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/validacoes.dart';
import 'package:mais_em_conta/enumCampo.dart';

class RegraDeTresControl extends ChangeNotifier {
  String? erro;

  void iniciarVariaveis() {
    print(TextController.RegraDeTres.A.titulo.hashCode);
  print(TextController.MaisEmConta.A.titulo.hashCode);
    // double? precoA = Converter.reaisParaDouble(TextController.A.preco.text);
    // if (precoA == 0) {
    //   Timer.run(() {
    //     TextController.A.preco.clear();
    //   });
    // }
    // double? precoB = Converter.reaisParaDouble(TextController.A.preco.text);
    // if (precoB == 0) {
    //   Timer.run(() {
    //     TextController.B.preco.clear();
    //   });
    // }
  }

  String? validar() {
    Campo pesoA = _validacoes(Validacao.peso(TextController.A.peso.text));
    Campo pesoB = _validacoes(Validacao.peso(TextController.B.peso.text));
    Campo precoA = _validacoes(Validacao.preco(TextController.A.preco.text));
    Campo precoB = _validacoes(Validacao.preco(TextController.B.preco.text));

    int produto = _validarCampos(pesoA, 2) *
        _validarCampos(pesoB, 3) *
        _validarCampos(precoA, 5) *
        _validarCampos(precoB, 7);
    print("produto: $produto");
    if (produto == 1)
      erro = Erro.campoVazioFaltando;
    else if (produto == 0)
      erro = Erro.campoIncorreto;
    else if (produto != 2 && produto != 3 && produto != 5 && produto != 7)
      erro = Erro.campoVazioRegraDeTres;
    else
      _chamarCalcular(produto);
    Timer.run(() {
      notifyListeners();
    });
  }

  void _chamarCalcular(int produto) {
    erro = '';
    double? precoA, precoB, pesoA, pesoB;

    pesoA = Converter.stringParaDouble(TextController.A.peso.text);
    pesoB = Converter.stringParaDouble(TextController.B.peso.text);
    precoA = Converter.reaisParaDouble(TextController.A.preco.text);
    precoB = Converter.reaisParaDouble(TextController.B.preco.text);

    if (produto == 2) {
      double valor = _regraDeTres(pesoB!, precoA!, precoB!);
      TextController.A.peso.text = valor.toStringAsFixed(2);
    }
    if (produto == 3) {
      double valor = _regraDeTres(pesoA!, precoB!, precoA!);
      TextController.B.peso.text = valor.toStringAsFixed(2);
    }
    if (produto == 5) {
      double valor = _regraDeTres(precoB!, pesoA!, pesoB!);
      TextController.A.preco.text =
          Converter.doubleParaTextControllerPreco(valor);
    }
    if (produto == 7) {
      double valor = _regraDeTres(precoA!, pesoB!, pesoA!);
      TextController.B.preco.text =
          Converter.doubleParaTextControllerPreco(valor);
    }

    notifyListeners();
  }

  double _regraDeTres(double mult1, double mult2, double div) {
    return (mult1 * mult2) / div;
  }

  Campo _validacoes(String? validacao) {
    String? erro = validacao;
    print("erro $erro");
    if (erro == null) return Campo.ok;
    if (erro == Erro.campoVazio)
      return Campo.vazio;
    else
      return Campo.incorreto;
  }

  int _validarCampos(Campo campo, int posicao) {
    if (campo == Campo.incorreto) return 0;
    if (campo == Campo.ok) return 1;
    if (campo == Campo.vazio) return posicao;
    return 0;
  }
}
