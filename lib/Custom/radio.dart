import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/tField.dart';
import 'package:mais_em_conta/controllers.dart/enumRadio.dart';
import 'package:mais_em_conta/controllers.dart/maisEmContaControl.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/converter.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/textos.dart';
import 'package:mais_em_conta/tipoInput.dart';
import 'package:mais_em_conta/validacoes.dart';

final pesoDigitado = TextEditingController();

Widget RadioCunst(MaisEmContaControl controller) {
  return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(TextController.A.peso.text),
                leading: Radio<PesosRadio>(
                  value: PesosRadio.pesoA,
                  groupValue: controller.pesoEscolhido,
                  onChanged: (PesosRadio? value) {
                    controller.pesoEscolhido = value;
                    controller.calcularNovosPrecos(Peso.peso.A!);
                    controller.preencherCards(Peso.peso.A!);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(TextController.B.peso.text),
                leading: Radio<PesosRadio>(
                  value: PesosRadio.pesoB,
                  groupValue: controller.pesoEscolhido,
                  onChanged: (PesosRadio? value) {
                    controller.pesoEscolhido = value;
                    controller.calcularNovosPrecos(Peso.peso.B!);
                    controller.preencherCards(Peso.peso.B!);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: TField(tipo: tipoInput.peso, controller: pesoDigitado),
                leading: Radio<PesosRadio>(
                  value: PesosRadio.pesoDigitado,
                  groupValue: controller.pesoEscolhido,
                  onChanged: (PesosRadio? value) {
                    controller.pesoEscolhido = value;
                    String? validacao = Validacao.peso(pesoDigitado.text);
                    if (validacao == null) {
                      double pesoDigitadoDouble =
                          Converter.stringParaDouble(pesoDigitado.text);
                      controller.calcularNovosPrecos(pesoDigitadoDouble);
                      controller.preencherCards(pesoDigitadoDouble);
                    }
                  },
                ),
              ),
            ),
          ],
        );
      });
}
