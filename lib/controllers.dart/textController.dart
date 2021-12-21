import 'package:flutter/material.dart';

class TextController {
  // TextEditingController titulo = TextEditingController();
  // TextEditingController peso = TextEditingController();
  // TextEditingController preco = TextEditingController();

  // static final A = TextController();
  // static final B = TextController();

  // static final maisDetalhesA = TextController();
  // static final maisDetalhesB = TextController();

  static final regraDeTres = _Cards();
  static final maisEmConta = _Cards();
  static final maisDetalhes = _Cards();
}

class _Cards {
  final A = ControllerCard();
  final B = ControllerCard();
}

class ControllerCard {
  final titulo = TextEditingController();
  final peso = TextEditingController();
  final preco = TextEditingController();
}
