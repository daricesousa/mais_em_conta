import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/card.dart';
import 'package:mais_em_conta/widgets/radio.dart';
import 'package:mais_em_conta/controllers.dart/mais_detalhes_control.dart';
import 'package:mais_em_conta/controllers.dart/text_controller.dart';
import 'package:mais_em_conta/Custom/cor.dart';

class MaisDetalhes extends StatefulWidget {
  const MaisDetalhes({Key? key}) : super(key: key);

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
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Text("Selecione o peso que deseja comprar"),
      ),
      radiosRow(controller),
      Visibility(
          visible: controller.pesoEscolhido != null,
          child: Column(
            children: [
              cards(),
              ListTile(
                title: Text(controller.economiza),
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
