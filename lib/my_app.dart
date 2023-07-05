import 'package:flutter/material.dart';
import 'package:minha_estante/app_routes.dart';
import 'package:minha_estante/providers/config_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConfigProvider storeConfig;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Estante Virtual',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes(),

      //home: const BookDetailsPage(),
      // home: const BookDetailsPage(),
    );
  }
}
