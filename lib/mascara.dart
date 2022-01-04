import 'dart:math';
import 'package:flutter/services.dart';

class MoneyMask extends TextInputFormatter {
  final int decimalLenght;
  final String decimal;
  final String fracion;
  final String moneySymbol;
  final double max = 99999.99;

  MoneyMask({
    this.decimalLenght = 2,
    this.decimal = '.',
    this.fracion = ',',
    this.moneySymbol = r'R$',
  });

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    String formatted = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (formatted.isEmpty || double.tryParse(formatted) == 0) {
      if (oldValue.text.length > newValue.text.length) {
        return const TextEditingValue(text: '');
      }
    }
    double value = double.parse(formatted) / pow(10, decimalLenght);
    if (value > max) return oldValue;

    formatted = value.toStringAsFixed(decimalLenght).replaceAll('.', fracion);

    int index = formatted.indexOf(fracion);
    for (int i = index - 3; i > 0; i -= 3) {
      final list = formatted.split('');
      list.insert(i, decimal);
      formatted = list.join();
    }
    formatted = '$moneySymbol $formatted';

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
