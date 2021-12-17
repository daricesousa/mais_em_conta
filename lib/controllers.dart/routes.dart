import 'package:flutter/material.dart';
import 'package:mais_em_conta/pages/layout.dart';
import 'package:mais_em_conta/pages/maisDetalhesPage.dart';
import 'package:mais_em_conta/pages/maisEmContaPage.dart';


final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class Routes {
  static const initial = RoutesNome.LAYOUT;
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesNome.LAYOUT: (_) => Layout(),
    RoutesNome.HOME: (_) => HomePage(),
    RoutesNome.MAISDETALHES: (_) => MaisDetalhes(),
  };
}

class RoutesNome {
  static const LAYOUT = '/layout';
  static const HOME = '/home';
  static const MAISDETALHES = '/maisDetalhes';
}
