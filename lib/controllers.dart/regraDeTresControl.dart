import 'package:flutter/material.dart';

class RegraDeTresControl extends ChangeNotifier {


  
  double regraDeTres(double valor1, double valor2, double valor3) {
    return (valor3 * valor2) / valor1;
  }
}
