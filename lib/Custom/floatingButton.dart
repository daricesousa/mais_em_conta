import 'package:flutter/material.dart';
import 'package:mais_em_conta/cor.dart';

class FloatingButtonCust extends StatelessWidget {
final void Function()? onPressed;
final IconData? icon;

FloatingButtonCust({required this.icon, required this.onPressed}) ;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
      backgroundColor: Cor.primary,
      
    );
  }
}
