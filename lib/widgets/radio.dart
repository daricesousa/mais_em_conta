import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/radioCustom.dart';
import 'package:mais_em_conta/Custom/tField.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/tipoInput.dart';
import 'package:mais_em_conta/controllers.dart/validacoes.dart';

final pesoDigitado = TextEditingController();
double _pesoDigitadoDouble = 0;

Widget RadiosRow(MaisDetalhesController controller) {
  return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioCunst(
              valor: PesosRadio.pesoA,
              controller: controller,
              peso: Peso.peso.A!,
              title: Text(TextController.A.peso.text),
            ),
            RadioCunst(
              valor: PesosRadio.pesoB,
              controller: controller,
              peso: Peso.peso.B!,
              title: Text(TextController.B.peso.text),
            ),
            RadioCunst(
              valor: PesosRadio.pesoDigitado,
              controller: controller,
              peso: _pesoDigitadoDouble,
              title: _titleDoRadio(controller),
              validacao: (Validacao.peso(pesoDigitado.text)) == null,
            ),
          ],
        );
      });
}


Widget _titleDoRadio(MaisDetalhesController controller){
  return TField(
                tipo: tipoInput.peso,
                controller: pesoDigitado,
                onChanged: (texto) {
                  String? _validacao = Validacao.peso(pesoDigitado.text);
                  if (_validacao == null) {
                    _pesoDigitadoDouble =
                        Converter.stringParaDouble(pesoDigitado.text)!;
                    controller.preencherCards(_pesoDigitadoDouble);
                    controller.calcularNovosPrecos(_pesoDigitadoDouble);
                  }
                },
              );
}