import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/tField.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/tipoInput.dart';

Widget card(
    {required ControllerCard controllerCard,
    required String letra,
    required Function funcao,
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
            onChanged: (e) {
              funcao();
            },
          ),
          TField(
            label: 'Peso',
            tipo: tipoInput.peso,
            controller: controllerCard.peso,
            habilitado: habilitado,
            onChanged: (e) {
              funcao();
            },
          ),
          TField(
            label: 'Preço',
            tipo: tipoInput.preco,
            controller: controllerCard.preco,
            habilitado: habilitado,
            onChanged: (e) {
              funcao();
            },
          ),
        ],
      ),
    ),
  ));
}
