import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/t_field.dart';
import 'package:mais_em_conta/controllers.dart/text_controller.dart';
import 'package:mais_em_conta/tipo_input.dart';

Widget card(
    {required ControllerCard controllerCard,
    required String letra,
    required Function funcao,
    bool apagavel = true,
    final Function()? funcaoApagar,
    bool habilitado = true}) {
  return Expanded(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            TField(
              letra: 'Produto $letra',
              tipo: tipoInput.titulo,
              controller: controllerCard.titulo,
              habilitado: habilitado,
              apagavel: apagavel,
              onChanged: (e) {
                funcao();
              },
            ),
            TField(
              label: 'Peso',
              tipo: tipoInput.peso,
              controller: controllerCard.peso,
              habilitado: habilitado,
              apagavel: apagavel,
              onChanged: (e) {
                funcao();
              },
            ),
            TField(
              label: 'Preço',
              tipo: tipoInput.preco,
              controller: controllerCard.preco,
              habilitado: habilitado,
              apagavel: apagavel,
              onChanged: (e) {
                funcao();
              },
            ),
          ],
        ),
      ),
    ),
  );
}
