import 'package:flutter/material.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/services/bookcase_service.dart';

class BookcaseProvider with ChangeNotifier {
  final service = BookcaseService();
  List<BooksEntity> _listBook = [];
  BooksEntity? _select;
  int? _index;

  BookcaseProvider() {
    fetchBooks();
  }

  set listBook(List<BooksEntity> val) {
    _listBook = val;
    service.save(_listBook);
    print(_listBook);
    notifyListeners();
  }

  List<BooksEntity> get listBook => _listBook;

  fetchBooks() async {
    listBook = await service.fetch();
  }
}
