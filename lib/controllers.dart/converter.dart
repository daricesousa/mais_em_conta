import 'package:flutter/material.dart';
import 'package:mais_em_conta/mascara.dart';

class Converter {
  static double? stringParaDouble(String text) {
    return double.tryParse(text.replaceAll(",", "."));
  }

  static double? reaisParaDouble(String text) {
    String valor =
        text.replaceAll(".", "").replaceAll(",", ".").replaceAll("R\$", "");
    return double.tryParse(valor);
  }

  static String doubleParaReais(double preco) {
    return "R\$ ${preco.toStringAsFixed(2).replaceAll(".", ",")}";
  }

  static String doubleParaTextControllerPreco(double preco){
    String text = preco.toStringAsFixed(2);
    final valor = TextEditingValue(text: text);
    return MoneyMask().formatEditUpdate(valor, valor).text;
  }

}
