import 'package:test/test.dart';
import 'package:minha_estante/entities/books_entity.dart';

void main() {
  group('BooksEntity', () {
    test('toJson should return a valid JSON map', () {
      // arrange
      final book = BooksEntity(
        title: 'Book Title',
        numberPage: 100,
        image: 'book_image.jpg',
        numberPageRead: 50,
      );

      // action
      final json = book.toJson();

      // assert
      expect(json, {
        'title': 'Book Title',
        'numberPage': 100,
        'image': 'book_image.jpg',
        'numberPageRead': 50,
      });
    });

    test('fromMap should return a valid BooksEntity object', () {
      // arrange
      final map = {
        'title': 'Book Title',
        'numberPage': 100,
        'image': 'book_image.jpg',
        'numberPageRead': 50,
      };

      // action
      final book = BooksEntity.fromMap(map);

      // assert
      expect(book.title, 'Book Title');
      expect(book.numberPage, 100);
      expect(book.image, 'book_image.jpg');
      expect(book.numberPageRead, 50);
    });

    test('fromJsonList should return a list of BooksEntity objects', () {
      // arrange
      final json = [
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

      // action
      final books = BooksEntity.fromJsonList(json);

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
