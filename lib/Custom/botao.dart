import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/cor.dart';

class Botao extends StatelessWidget {
  final void Function() onPressed;
  final bool loading;
  Botao({required this.onPressed, this.loading = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal:10),
      height: 45,
      width: 1000,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Cor.primary),
        ),
        child: Text(
          'CONFIRMAR',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
