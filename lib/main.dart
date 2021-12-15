import 'package:flutter/material.dart';
import 'package:mais_em_conta/Custom/cor.dart';
import 'package:mais_em_conta/controllers.dart/routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Mais em conta',
    theme: ThemeData(primaryColor: Cor.primary, hintColor: Cor.primary),
    routes: Routes.routes,
    initialRoute: Routes.initial,
    navigatorKey: navigatorKey,
  ));
}
