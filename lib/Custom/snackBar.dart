import 'package:flutter/material.dart';

class SnackBarCustomizado {
   static SnackBar snack({required String text, Color? backgroundColor}) {
    return SnackBar(
      content: Text(text, textAlign: TextAlign.center,),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 2),
    );
  }
}
