import 'package:flutter/material.dart';
import 'package:minha_estante/app_routes.dart';
import 'package:minha_estante/pages/bookDetails/book_details_page.dart';
import 'package:minha_estante/pages/homePage/home_page.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BookcaseProvider storeConfig;
  @override
  Widget build(BuildContext context) {
    storeConfig = Provider.of<BookcaseProvider>(context);
    // TODO: implement build
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
