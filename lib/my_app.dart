import 'package:flutter/material.dart';
import 'package:minha_estante/app_routes.dart';
import 'package:minha_estante/providers/config_provider.dart';
import 'package:minha_estante/style/theme_style.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConfigProvider storeConfig;
  @override
  Widget build(BuildContext context) {
    storeConfig = Provider.of<ConfigProvider>(context);
    return MaterialApp(
      title: 'Estante',
      themeMode: storeConfig.tema,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes(),
      theme: MyTheme.claro,
      darkTheme: MyTheme.escuro,
    );
  }
}
