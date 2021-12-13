import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/card.dart';
import 'package:mais_em_conta/Custom/divider.dart';
import 'package:mais_em_conta/Custom/radio.dart';
import 'package:mais_em_conta/Custom/style.dart';
import 'package:mais_em_conta/Custom/tField.dart';
import 'package:mais_em_conta/controllers.dart/maisEmContaControl.dart';
import 'package:mais_em_conta/controllers.dart/textController.dart';
import 'package:mais_em_conta/controllers.dart/variaveis.dart';
import 'package:mais_em_conta/cor.dart';
import 'package:mais_em_conta/textos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = MaisEmContaControl();

  @override
  void initState() {
    controller.prencherPrecos();
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
                  Row(
                    children: [
                      card(
                        letra: 'A',
                        textController: TextController.A,
                        funcao: controller.chamarCalcular,
                      ),
                      card(
                        letra: 'B',
                        textController: TextController.B,
                        funcao: controller.chamarCalcular,
                      ),
                    ],
                  ),
                  DividerCust(),
                  controller.maisEconomico != ''
                      ? Text(controller.maisEconomico)
                      : Text(controller.erro ?? ''),
                  DividerCust(),
                  controller.calculado
                      ? ExpansionTile(
                          title: Text(
                            "Mais detalhes",
                            textAlign: TextAlign.center,
                          ),
                          trailing: Container(width: 20),
                          leading: Container(
                            width: 10,
                          ),
                          // onExpansionChanged: (e){
                          //   controller.aberto = true;
                          //   // pesoEscolhido = null;
                          // },
                          tilePadding: EdgeInsets.zero,
                          children: [
                            RadioCunst(controller),
                            controller.pesoEscolhido != null
                                ? Row(
                                    children: [
                                      card(
                                        letra: 'A',
                                        textController:
                                            TextController.maisDetalhesA,
                                        habilitado: false,
                                        funcao: () {},
                                      ),
                                      card(
                                        letra: 'B',
                                        textController:
                                            TextController.maisDetalhesB,
                                        funcao: () {},
                                        habilitado: false,
                                      ),
                                    ],
                                  )
                                : Container(),
                            controller.pesoEscolhido != null
                                ? ListTile(
                                    title: Text(
                                        "${controller.controllerMaisDetalhes.economiza}"),
                                  )
                                : Container(),
                          ],
                        )
                      : Container(),
                ],
              );
            }),
            Wrap(
              children: [
                Container(width: 100, height: 50, color: Colors.red,),
                Container(width: 100, height: 50, color: Colors.blue,),
                Container(width: 100, height: 50, color: Colors.red,),
                Container(width: 100, height: 50, color: Colors.blue,),


              ],
            )
      ],
    );
  }
}
