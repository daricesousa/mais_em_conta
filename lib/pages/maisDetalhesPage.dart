import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/card.dart';
import 'package:mais_em_conta/widgets/radio.dart';
import 'package:mais_em_conta/controllers.dart/maisDetalhesControl.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/Custom/cor.dart';

class MaisDetalhes extends StatefulWidget {
  @override
  _MaisDetalhesState createState() => _MaisDetalhesState();
}

class _MaisDetalhesState extends State<MaisDetalhes> {
  MaisDetalhesController controller = MaisDetalhesController();

  @override
  void initState() {
    controller.pesoEscolhido = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cor.primary,
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            return body();
          }),
    );
  }

  Widget body() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("Selecione o peso que deseja comprar"),
      ),
      RadiosRow(controller),
      Visibility(
          visible: controller.pesoEscolhido != null,
          child: Column(
            children: [
              cards(),
              ListTile(
                title: Text("${controller.economiza}"),
              ),
            ],
          )),
    ]);
  }

  Widget cards() {
    return Row(
      children: [
        card(
          letra: 'A',
          controllerCard: TextController.maisDetalhes.A,
          habilitado: false,
          apagavel: false,
          funcao: () {},
        ),
        card(
          letra: 'B',
          controllerCard: TextController.maisDetalhes.B,
          funcao: () {},
          habilitado: false,
          apagavel: false
        ),
      ],
    );
  }
}
