import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/botao.dart';
import 'package:mais_em_conta/Custom/card.dart';
import 'package:mais_em_conta/Custom/divider.dart';
import 'package:mais_em_conta/Custom/style.dart';
import 'package:mais_em_conta/controllers.dart/mais_em_conta_control.dart';
import 'package:mais_em_conta/controllers.dart/text_controller.dart';
import 'package:mais_em_conta/Custom/cor.dart';
import 'package:mais_em_conta/controllers.dart/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        title: const Text('Mais em Conta'),
        backgroundColor: Cor.primary,
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return RefreshIndicator(
            onRefresh: () async {
              controller.limparCampos();
            },
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Center(
                  child: Column(
                    children: [
                      cards(),
                      const DividerCust(),
                      Botao(onPressed: () {
                        controller.chamarCalcular();
                        FocusScope.of(context).requestFocus(FocusNode());
                      }),
                      const DividerCust(),
                      mensagemMaisEconomico(),
                      const DividerCust(),
                      botaoMaisDetalhes(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
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
      visible: controller.calculado,
      child: Text(controller.maisEconomico, style: Style.titulo),
      replacement: Text(controller.erro ?? '', style:  Style.texto,),
    );
  }

  Widget botaoMaisDetalhes() {
    return Visibility(
      visible: controller.calculado,
      child: GestureDetector(
        child: const Text(
          "Mais detalhes",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        onTap: () => Navigator.pushNamed(context, RoutesNome.MAISDETALHES),
      ),
    );
  }
}
