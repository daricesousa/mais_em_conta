import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/botao.dart';
import 'package:mais_em_conta/Custom/card.dart';
import 'package:mais_em_conta/Custom/cor.dart';
import 'package:mais_em_conta/Custom/divider.dart';
import 'package:mais_em_conta/controllers.dart/regra_de_tres_control.dart';
import 'package:mais_em_conta/controllers.dart/text_controller.dart';

class RegraDeTresPage extends StatefulWidget {
  const RegraDeTresPage({Key? key}) : super(key: key);

  @override
  _RegraDeTresPageState createState() => _RegraDeTresPageState();
}

class _RegraDeTresPageState extends State<RegraDeTresPage> {
  final controller = RegraDeTresControl();

  @override
  void initState() {
    controller.iniciarCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Regra de três"),
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
                Column(
                  children: [
                    cards(),
                    const DividerCust(),
                    Botao(onPressed: () {
                      controller.validar();
                      FocusScope.of(context).requestFocus(FocusNode());
                    }),
                    const DividerCust(),
                    Text(controller.erro ?? ''),
                  ],
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
            controllerCard: TextController.regraDeTres.A,
            funcao: () {}),
        card(
          letra: 'B',
          controllerCard: TextController.regraDeTres.B,
          funcao: () {},
        ),
      ],
    );
  }
}
