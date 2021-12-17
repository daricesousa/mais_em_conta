import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';


class LayoutControl extends ChangeNotifier{

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

}