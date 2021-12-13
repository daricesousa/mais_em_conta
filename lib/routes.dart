import 'package:flutter/material.dart';
import 'package:mais_em_conta/pages/maisEmContaPage.dart';


final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class Routes {
  static const initial = RoutesNome.HOME;
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesNome.HOME: (_) => HomePage(),
    // RoutesNome.CONTATO: (_) => ContatoPage(),
  };
}

class RoutesNome {
  static const HOME = '/home';
  static const CONTATO = '/contato';
}
