import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minha_estante/commons/components/space_component.dart';
import 'package:minha_estante/commons/helpers/convert_upper_case.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/enum/book_state_enum.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:minha_estante/services/bookcase_service.dart';
import 'package:provider/provider.dart';

class BookCaseFormDialog extends StatefulWidget {
  final void Function(BooksEntity item) callback;
  const BookCaseFormDialog({super.key, required this.callback});

  @override
  State<BookCaseFormDialog> createState() => _BookCaseFormDialogState();
}

class _BookCaseFormDialogState extends State<BookCaseFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNumberPage = TextEditingController();
  final _controllerTitle = TextEditingController();
  final service = BookcaseService();
  final List<BooksEntity> listBook = [];
  late BookcaseProvider store;

  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      final item = BooksEntity(
        title: convertToUpperCase(_controllerTitle.text),
        numberPage: int.parse(_controllerNumberPage.text),
        // state: StateBook.lerDepois,
        uuid: 'uuid',
      );
      Navigator.pop(context);
      widget.callback(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 35, right: 35, bottom: 35, top: 5),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SpacerComponent(),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Adicione um livro novo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SpacerComponent(),
              TextFormField(
                controller: _controllerTitle,
                decoration: const InputDecoration(hintText: 'Título do livro'),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Por favor digite um nome'
                      : null;
                },
              ),
              const SpacerComponent(),
              TextFormField(
                controller: _controllerNumberPage,
                decoration:
                    const InputDecoration(hintText: 'Número de páginas'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Por favor digite um valor'
                      : null;
                },
              ),
              const SpacerComponent(),
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
