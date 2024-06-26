import 'package:test/test.dart';
import 'package:minha_estante/commons/helpers/convert_upper_case.dart';

void main() {
  //Testes de sucesso
  test(
      'Deve converter para maisculo a primeira letra , quando recebe somente uma palavra',
      () {
    //arrange
    final word = 'tocantins';
    const expectedResult = 'Tocantins';

    //action
    final result = convertToUpperCase(word);
    //assert
    expect(result, expectedResult);
  });
  test(
      'Deve converter para maisculo a primeira letra , quando recebe mais de uma palavra',
      () {
    //arrange
    final word = 'são paulo';
    final expectResult = 'São Paulo';
    //action
    final result = convertToUpperCase(word);
    //assert
    expect(result, word);
  });

  test('Deve retornar a palavra vazia quando recebe uma string vazia', () {
    //arrange
    final word = '';
    final expectResult = '';
    //action
    final result = convertToUpperCase(word);
    //assert
    expect(result, expectResult);
  });

  test(
      'Deve retornar a mesma palavra quando recebe uma palavra já em maiúsculo',
      () {
    // arrange
    final word = 'FLUTTER';
    final expectedResult = 'FLUTTER';

    // action
    final result = convertToUpperCase(word);

    // assert
    expect(result, expectedResult);
  });

  test(
      'Deve retornar a mesma palavra quando recebe uma palavra com apenas uma letra',
      () {
    // arrange
    final word = 'a';
    final expectedResult = 'A';

    // action
    final result = convertToUpperCase(word);

    // assert
    expect(result, expectedResult);
  });

  test('Deve restornar', () {
    //arrange
    final input = 'tocantins';
    final expectResult = 'Tocantins';
    //action
    final result = capitalizeFirstLetter(input);
    //assert
    expect(result, expectResult);
  });
}
