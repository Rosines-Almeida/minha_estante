import 'package:minha_estante/entities/books_entity.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  late BooksEntity bookEntity;
  late Map<String, dynamic> bookMap;
  late BooksEntity bookEntityWithoutImg;
  late Map<String, dynamic> bookMapWithoutImg;
  late List<Map<String, dynamic>> listBookMap;
  late List<BooksEntity> listBookEntity;
  setUp(() {
    bookEntity = BooksEntity(
      numberPage: 100,
      title: 'Book Title',
      image: 'book_image.jpg',
      numberPageRead: 50,
    );

    bookMap = {
      'numberPage': 100,
      'title': 'Book Title',
      'image': 'book_image.jpg',
      'numberPageRead': 50
    };

    bookEntityWithoutImg = BooksEntity(
      numberPage: 100,
      title: 'Book Title',
      numberPageRead: 50,
    );

    bookMapWithoutImg = {
      'numberPage': 100,
      'title': 'Book Title',
      'numberPageRead': 50
    };
    listBookMap = [bookMap, bookMapWithoutImg];

    listBookEntity = [bookEntity, bookEntityWithoutImg];
  });

  group('metodos: toJson', () {
    test('Deve retornar um Map<String, dynamic>  a partir de uma BooksEntity',
        () {
      final result = bookEntity.toJson();
      expect(result, bookMap);
      expect(result, isMap);
    });

    test(
        'Deve retornar um Map<String, dynamic>  partir de uma BooksEntity  SEM atributo imagem',
        () {
      final result = bookEntityWithoutImg.toJson();
      expect(result, bookMapWithoutImg);
      expect(result['image'], isNull);
    });
  });

  group('Métodos: fromMap', () {
    test(
        'Deve retorna um BooksEntity a partir de um Map<String, dynamic> COM atributo img',
        () {
      final result = BooksEntity.fromMap(bookMap);
      expect(result.title, bookEntity.title);
    });

    test(
        'Deve retorna um BooksEntity a partir de um Map<String, dynamic> SEM atributo img',
        () {
      //action
      final result = BooksEntity.fromMap(bookMapWithoutImg);
      //assert
      expect(result.title, bookEntityWithoutImg.title);
      expect(result.image, isNull);
    });
  });

  group('teste do metodo: fromJsonList', () {
    test(
        'Deve retornar List<BooksEntity> a partir de um List<dynamic> COM atributo img',
        () {
      //action

      final result = BooksEntity.fromJsonList(listBookMap);

      //assert
      expect(result[0].numberPage, listBookEntity[0].numberPage);
      expect(result[0].image, listBookEntity[0].image);
      expect(result[0].numberPageRead, listBookEntity[0].numberPageRead);
      expect(result[0].title, listBookEntity[0].title);
      expect(result[0].numberPage, listBookEntity[0].numberPage);

      expect(result[1].numberPageRead, listBookEntity[1].numberPageRead);
      expect(result.length, listBookEntity.length);
      expect(result[1].image, isNull);
    });
  });
}
