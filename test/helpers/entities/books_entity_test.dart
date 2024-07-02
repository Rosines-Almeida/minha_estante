import 'package:test/test.dart';
import 'package:minha_estante/entities/books_entity.dart';

void main() {
  late BooksEntity book;
  late Map<String, dynamic> jsonResult;
  late List<Map<String, dynamic>> arrayJson;
  // late result;
  setUp(() {
    book = BooksEntity(
      title: 'Book Title',
      numberPage: 100,
      image: 'book_image.jpg',
      numberPageRead: 50,
    );

    jsonResult = {
      'title': 'Book Title',
      'numberPage': 100,
      'image': 'book_image.jpg',
      'numberPageRead': 50,
    };

    arrayJson = [
      {
        'title': 'Book 1',
        'numberPage': 100,
        'image': 'book1_image.jpg',
        'numberPageRead': 50,
      },
      {
        'title': 'Book 2',
        'numberPage': 200,
        'image': 'book2_image.jpg',
        'numberPageRead': 100,
      },
    ];
  });

  group('BooksEntity', () {
    test('toJson should return a valid JSON map', () {
      // action
      final json = book.toJson();
      // assert
      expect(json, jsonResult);
    });

    test('fromMap should return a valid BooksEntity object', () {
      // arrange

      // action
      final book = BooksEntity.fromMap(jsonResult);

      // assert
      expect(book.title, 'Book Title');
      expect(book.numberPage, 100);
      expect(book.image, 'book_image.jpg');
      expect(book.numberPageRead, 50);
    });

    test('fromJsonList should return a list of BooksEntity objects', () {
      // action
      final books = BooksEntity.fromJsonList(arrayJson);

      // assert
      expect(books.length, 2);
      expect(books[0].title, 'Book 1');
      expect(books[0].numberPage, 100);
      expect(books[0].image, 'book1_image.jpg');
      expect(books[0].numberPageRead, 50);
      expect(books[1].title, 'Book 2');
      expect(books[1].numberPage, 200);
      expect(books[1].image, 'book2_image.jpg');
      expect(books[1].numberPageRead, 100);
    });
  });
}
