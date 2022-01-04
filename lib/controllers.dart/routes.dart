// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mais_em_conta/pages/layout.dart';
import 'package:mais_em_conta/pages/mais_detalhes_page.dart';
import 'package:mais_em_conta/pages/mais_em_comta_page.dart';


final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class Routes {
  static const initial = RoutesNome.LAYOUT;
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesNome.LAYOUT: (_) => const Layout(),
    RoutesNome.HOME: (_) => const HomePage(),
    RoutesNome.MAISDETALHES: (_) => const MaisDetalhes(),
  };
}

class RoutesNome {
  static const LAYOUT = '/layout';
  static const HOME = '/home';
  static const MAISDETALHES = '/maisDetalhes';
}
