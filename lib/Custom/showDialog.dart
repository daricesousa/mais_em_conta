import 'package:flutter/material.dart';
import 'package:mais_em_conta/routes.dart';

import 'style.dart';

showDialogCust(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Descartar alterações?'),
        content: Text('Se sair as alterações serão perdidas'),
        actions: [
          TextButton(
              onPressed: navigator.pop,
              child: Text(
                'Cancelar',
                style: Style.texto,
              )),
          TextButton(
              onPressed: () {
                navigator.pop();
                navigator.pop();
              },
              child: Text('Sair', style: Style.texto)),
        ],
      );
    },
  );
}
