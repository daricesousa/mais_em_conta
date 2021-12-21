import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/style.dart';
import 'package:mais_em_conta/Custom/cor.dart';
import 'package:flutter/services.dart';
import 'package:mais_em_conta/mascara.dart';
import 'package:mais_em_conta/tipoInput.dart';

class TField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  late final tipoInput tipo;
  final String? letra;
  final Function()? funcaoIcon;
  late final bool habilitado;

  TField({
    required this.tipo,
    this.controller,
    this.onChanged,
    this.label,
    this.validator,
    this.letra,
    this.habilitado = true,
    this.funcaoIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        enabled: habilitado,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Style.texto,
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
      suffixIcon: Container(
        width: 1,
        child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
              iconSize: 10, onPressed: funcaoIcon, icon: Icon(Icons.close, color: Cor.primary,)),
        ),
      ),
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
        return [MoneyMask()];
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
