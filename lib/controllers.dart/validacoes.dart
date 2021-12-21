import 'package:mais_em_conta/Custom/textos.dart';

import 'converter.dart';

class Validacao {
  static String? peso(String? text) {
    late double? peso;
    if (text == null || text.isEmpty) return Erro.campoVazio;
    peso = Converter.stringParaDouble(text);
    if (peso == null) return Erro.campoIncorreto;
    if (peso == 0) return Erro.pesoIncorreto;
  }

  static String? preco(String? text) {
    late double? preco;
    if (text == null || text.isEmpty) return Erro.campoVazio;
    preco = Converter.reaisParaDouble(text);
    if (preco == null) return Erro.campoIncorreto;
    if (preco == 0) return Erro.precoIncorreto;
  }
}
