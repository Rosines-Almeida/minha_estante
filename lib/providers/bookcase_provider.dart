import 'package:flutter/material.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/pages/tabs/bookcase_form_dialog.dart';
import 'package:minha_estante/services/bookcase_service.dart';

class BookcaseProvider with ChangeNotifier {
  final service = BookcaseService();
  List<BooksEntity> _listBook = [];
  BooksEntity? _select;
  int? _index;

  BookcaseProvider() {
    fetchBooks();
  }

  fetchBooks() async {
    listBook = await service.fetch();
  }

  List<BooksEntity> get listBook => _listBook;

  BooksEntity? get selecionado {
    return _select;
  }

  set selecionado(BooksEntity? val) {
    _select = val;
    notifyListeners();
  }

  set idx(int val) {
    _index = val;
    notifyListeners();
  }

  void atualizarItemAfazer(int idx) {
    if (selecionado != null) {
      _listBook[idx] = _select!;
      service.save(_listBook);
      notifyListeners();
    }
  }

  set listBook(List<BooksEntity> val) {
    _listBook = val;
    service.save(_listBook);
    print(_listBook);
    notifyListeners();
  }

  void openFormDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              BookCaseFormDialog(
                callback: (item) {
                  listBook = [item, ...listBook];
                },
              )
            ],
          );
        });
  }
}
