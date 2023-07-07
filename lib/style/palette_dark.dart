import 'package:flutter/material.dart';
import 'package:minha_estante/style/pallete_style.dart';

class PalletDark implements PalleteStyle {
  @override
  Color primary = Color.fromARGB(255, 81, 114, 70);

  @override
  Color accent = Color(0xffF1C376);

  @override
  Color background = Colors.grey[800]!;

  @override
  Color backgroundDark = Colors.grey[800]!;

  @override
  Color error = Colors.red;

  @override
  Color primaryDark = Color(0xff606C5D);

  @override
  Color secondary = Colors.grey[400]!;

  @override
  Color success = Colors.green[800]!;

  @override
  Color text = Colors.grey[50]!;

  @override
  Color textSecondary = Colors.white;

  @override
  Color warning = Colors.yellow[900]!;

  @override
  Color white = Colors.white;
}
