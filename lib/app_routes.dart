import 'package:flutter/material.dart';
import 'package:minha_estante/pages/bookDetails/book_details_page.dart';
import 'package:minha_estante/pages/homePage/home_page.dart';

class AppRoutes {
  static String home = '/';
  static String bookDetails = '/bookDetails';
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      home: (context) => const HomePage(),
      bookDetails: (context) => const BookDetailsPage(),
    };
  }
}
