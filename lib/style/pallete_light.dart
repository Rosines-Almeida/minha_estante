import 'package:flutter/material.dart';
import 'package:minha_estante/style/pallete_style.dart';

class PalleteLight implements PalleteStyle {
  @override
  Color primary = Color(0xff606C5D);

  @override
  Color accent = Color(0xffF1C376);

  @override
  Color background = Color(0xffFFF4F4);

  @override
  Color backgroundDark = Color(0xffFFF4F4);

  @override
  Color error = Colors.red;

  @override
  Color primaryDark = Color(0xff606C5D);

  @override
  Color secondary = Colors.grey;

  @override
  Color success = Colors.green;

  @override
  Color text = Colors.black87;

  @override
  Color textSecondary = Colors.black;

  @override
  Color warning = Colors.yellow[700]!;

  @override
  Color white = Colors.white;
}
