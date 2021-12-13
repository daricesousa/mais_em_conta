import 'package:mais_em_conta/textos.dart';

import 'controllers.dart/converter.dart';

class Validacao {
  static String? peso(String? text) {
    late double peso;
    if (text == null || text == '') {
      return Erro.campoVazio;
    }
    try {
      peso = Converter.stringParaDouble(text);
    } catch (e) {
      return Erro.campoIncorreto;
    }
    if (peso == 0) {
      return Erro.pesoIncorreto;
    }
  }

  static String? preco(String? text) {
    late double preco;
    if (text == null || text == '') {
      return Erro.campoVazio;
    }
    try {
      preco = Converter.reaisParaDouble(text);
    } catch (e) {
      return Erro.campoIncorreto;
    }
    if (preco == 0) {
      return Erro.precoIncorreto;
    }
  }
}


