import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/card.dart';
import 'package:mais_em_conta/Custom/divider.dart';
import 'package:mais_em_conta/Custom/style.dart';
import 'package:mais_em_conta/controllers.dart/maisEmContaControl.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/Custom/cor.dart';
import 'package:mais_em_conta/controllers.dart/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = MaisEmContaControl();

  @override
   void initState() {
    controller.iniciarCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mais em Conta'),
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
                  mensagemMaisEconomico(),
                  DividerCust(),
                  botaoMaisDetalhes(),
                ],
              );
            }),
      ],
    );
  }

  Widget cards() {
    return Row(
      children: [
        card(
          letra: 'A',
          controllerCard: TextController.maisEmConta.A,
          funcao: controller.chamarCalcular,
        ),
        card(
          letra: 'B',
          controllerCard: TextController.maisEmConta.B,
          funcao: controller.chamarCalcular,
        ),
      ],
    );
  }

  Widget mensagemMaisEconomico() {
    return Visibility(
      visible: controller.maisEconomico != '',
      child: Text(controller.maisEconomico, style: Style.titulo),
      replacement: Text(controller.erro ?? ''),
    );
  }

  Widget botaoMaisDetalhes() {
    return Visibility(
      visible: controller.calculado,
      child: GestureDetector(
        child: Text(
          "Mais detalhes",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        onTap: () => Navigator.pushNamed(context, RoutesNome.MAISDETALHES),
      ),
    );
  }
}
