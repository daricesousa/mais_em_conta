import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mais_em_conta/widgets/radio.dart';
import 'package:mais_em_conta/enumRadio.dart';
export 'package:mais_em_conta/enumRadio.dart';
import 'package:mais_em_conta/Custom/cor.dart';
export 'package:mais_em_conta/controllers.dart/maisDetalhesControl.dart';
import 'package:mais_em_conta/controllers.dart/maisDetalhesControl.dart';

class RadioCunst extends StatefulWidget {
  final PesosRadio valor;
  double peso;
  final MaisDetalhesController controller;
  final Widget title;
  final bool validacao;

  RadioCunst({
    required this.valor,
    required this.peso,
    required this.controller,
    required this.title,
    this.validacao = true,
  });
  @override
  _RadioCunstState createState() => _RadioCunstState();
}

class _RadioCunstState extends State<RadioCunst> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Radio<PesosRadio>(
            activeColor: Cor.primary,
            value: widget.valor,
            groupValue: widget.controller.pesoEscolhido,
            onChanged: (PesosRadio? value) {
              widget.controller.pesoEscolhido = value;
              if (!widget.validacao) {
                widget.peso = 0;
                pesoDigitado.text = '0';
              }
              widget.controller.calcularNovosPrecos(widget.peso);
              widget.controller.preencherCards(widget.peso);
            },
          ),
          widget.title,
        ],
      ),
    );
  }
}