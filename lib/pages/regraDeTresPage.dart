import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/card.dart';
import 'package:mais_em_conta/Custom/cor.dart';
import 'package:mais_em_conta/Custom/divider.dart';
import 'package:mais_em_conta/controllers.dart/regraDeTresControl.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';

class RegraDeTresPage extends StatefulWidget {
  @override
  _RegraDeTresPageState createState() => _RegraDeTresPageState();
}

class _RegraDeTresPageState extends State<RegraDeTresPage> {
  final controller = RegraDeTresControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regra de três"),
        backgroundColor: Cor.primary,
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        AnimatedBuilder(
            animation: controller,
            builder: (context, snapshot) {
              return Column(
                children: [
                  cards(),
                  DividerCust(),
                  // mensagemMaisEconomico(),
                  // DividerCust(),
                  // botaoMaisDetalhes(),
                ],
              );
            }),
      ],
    );
  }

  Widget cards() {
    return Row(
      children: [
        card(letra: 'A', textController: TextController.A, funcao: () {}),
        card(
          letra: 'B',
          textController: TextController.B,
          funcao: () {},
        ),
      ],
    );
  }
}
