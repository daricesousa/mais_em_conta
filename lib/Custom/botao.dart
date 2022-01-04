import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/cor.dart';

class Botao extends StatelessWidget {
  final void Function() onPressed;
  final bool loading;
  const Botao({Key? key, required this.onPressed, this.loading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 45,
      width: 1000,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Cor.primary),
        ),
        child: const Text(
          'Calcular',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
