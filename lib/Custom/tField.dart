import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/style.dart';
import 'package:mais_em_conta/cor.dart';
import 'package:flutter/services.dart';
import 'package:mais_em_conta/tipoInput.dart';
import 'package:mais_em_conta/currencyInputFormatter.dart';

class TField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  late tipoInput tipo;
  final String? letra;
  late bool habilitado;

  TField({
    required this.tipo,
    this.controller,
    this.onChanged,
    this.label,
    this.validator,
    this.letra,
    this.habilitado = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        enabled: habilitado,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Style.texto,
        textAlign: TextAlign.center,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        cursorColor: Cor.primary,
        decoration: decoration(),
        inputFormatters: inputFormatters(),
      ),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      labelText: label,
      hintText: tipo == tipoInput.titulo ? letra : '',
      hintStyle: tipo == tipoInput.titulo ? Style.titulo : Style.texto,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: Style.texto,
      enabledBorder: border(),
      focusedBorder: border(),
    );
  }

  InputBorder border() {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: tipo == tipoInput.titulo
                ? Colors.transparent
                : Cor.primary.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10));
  }

  List<TextInputFormatter> inputFormatters() {
    switch (tipo) {
      case tipoInput.preco:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(7),
          CurrencyInputFormatter()
        ];
      case tipoInput.peso:
        return [
          FilteringTextInputFormatter.allow(RegExp("[0-9.,]")),
          LengthLimitingTextInputFormatter(7),
        ];
      case tipoInput.titulo:
        return [];
    }
  }
}
