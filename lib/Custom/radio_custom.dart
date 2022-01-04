import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mais_em_conta/widgets/radio.dart';
import 'package:mais_em_conta/enum_radio.dart';
export 'package:mais_em_conta/enum_radio.dart';
import 'package:mais_em_conta/Custom/cor.dart';
export 'package:mais_em_conta/controllers.dart/mais_detalhes_control.dart';
import 'package:mais_em_conta/controllers.dart/mais_detalhes_control.dart';

class RadioCunst extends StatefulWidget {
  final PesosRadio valor;
  final double peso;
  final MaisDetalhesController controller;
  final Widget title;
  final bool validacao;

  const RadioCunst({
    Key? key,
    required this.valor,
    required this.peso,
    required this.controller,
    required this.title,
    this.validacao = true,
  }): super(key: key);
  @override
  _RadioCunstState createState() => _RadioCunstState();
}

class _RadioCunstState extends State<RadioCunst> {
  late double peso;

@override
  void initState() {
    peso = widget.peso;
    super.initState();
  }

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
                peso = 0;
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