import 'dart:convert';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookcaseService {
  final _keyListBook = 'KEY_LIST_BOOK';

  Future<void> save(List<BooksEntity> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(item);

    await prefs.setString(_keyListBook, listJson);
  }

  Future<List<BooksEntity>> fetch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_keyListBook);

    if (listJson != null) {
      return BooksEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}
