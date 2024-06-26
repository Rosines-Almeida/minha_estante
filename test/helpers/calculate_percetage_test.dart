import 'dart:math';

import 'package:test/test.dart';
import 'package:minha_estante/commons/helpers/calculate_percetage.dart';

void main() {
  test('deve efetuar o calculo de porcentagem', () {
    //arrange
    int pagesRead = 10;
    int totalPages = 20;
    const expectedResult = 50;
    //action
    final result = calculatePercetage(pagesRead, totalPages);
    //assert
    expect(result, equals(expectedResult));
  });

  test('deve retornar o excessão de erro se pagesread < 0 ', () {
    int pagesRead = -1;
    int totalPages = 10;

    expect(() => calculatePercetage(pagesRead, totalPages), throwsException);
  });

  test('deve retornar 0 quando pagesRead for 0', () {
    int pagesRead = 0;
    int totalPages = 10;

    final result = calculatePercetage(pagesRead, totalPages);

    expect(result, equals(0));
  });

  test('deve retornar 0 quando totalPages for 0', () {
    int pagesRead = 10;
    int totalPages = 0;

    final result = calculatePercetage(pagesRead, totalPages);

    expect(result, equals(0));
  });

  test('deve retornar 100 quando pagesRead for igual a totalPages', () {
    int pagesRead = 10;
    int totalPages = 10;

    final result = calculatePercetage(pagesRead, totalPages);

    expect(result, equals(100));
  });

  test('deve retornar maior que 100  quando pagesRead for maior que totalPages',
      () {
    int pagesRead = 15;
    int totalPages = 10;
    final result = calculatePercetage(pagesRead, totalPages);
    print(result);
    expect(result, greaterThan(100));
  });
}
