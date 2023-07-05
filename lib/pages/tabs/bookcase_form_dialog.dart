import 'package:flutter/material.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/services/bookcase_service.dart';

class BookCaseFormDialog extends StatefulWidget {
  const BookCaseFormDialog({super.key});

  @override
  State<BookCaseFormDialog> createState() => _BookCaseFormDialogState();
}

class _BookCaseFormDialogState extends State<BookCaseFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNumberPage = TextEditingController();
  final _controllerTitle = TextEditingController();
  final service = BookcaseService();
  final List<BooksEntity> listBook = [];

  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      final item = BooksEntity(
          title: 'title', numberPage: 200, state: 'state', uuid: 'uuid');
      print('isvalid');
      listBook.add(item);
      service.save(listBook);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('Adicione um novo livro na sua estante'),
              TextFormField(
                controller: _controllerTitle,
                decoration: InputDecoration(hintText: 'Título do livro'),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Por favor digite um nome'
                      : null;
                },
              ),
              TextFormField(
                controller: _controllerNumberPage,
                decoration: InputDecoration(hintText: 'Número de páginas'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Por favor digite um valor'
                      : null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: handleSubmit,
                    child: const Text('Adicionar'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
