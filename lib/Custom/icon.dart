import 'package:flutter/material.dart';
import 'package:mais_em_conta/cor.dart';

class IconCustom extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;

  IconCustom(this.icon,{this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: color ?? Cor.primary);
  }
}
