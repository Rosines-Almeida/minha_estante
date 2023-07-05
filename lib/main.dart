import 'package:flutter/material.dart';
import 'package:minha_estante/my_app.dart';
import 'package:minha_estante/providers/root_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: RootProvider.providers(),
    child: const MyApp(),
  ));
}
