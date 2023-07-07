import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minha_estante/commons/components/space_component.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';

class BookDetailsEditDialog extends StatefulWidget {
  const BookDetailsEditDialog(
      {super.key, required this.callback, required this.numberMaxPag});
  final int numberMaxPag;
  final void Function(int numberPage) callback;

  @override
  State<BookDetailsEditDialog> createState() => _BookDetailsEditDialogState();
}

class _BookDetailsEditDialogState extends State<BookDetailsEditDialog> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNumberPageEdit = TextEditingController();
  late BookcaseProvider store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text('Atualize os dados'),
        Form(
          key: _formKey,
          child: TextFormField(
            controller: _controllerNumberPageEdit,
            decoration: const InputDecoration(
              labelText: 'Numero de páginas lidas',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor digite um valor';
              } else if (int.parse(value) > widget.numberMaxPag) {
                return 'Número inválido';
              } else {
                return null;
              }
            },
          ),
        ),
        const SpacerComponent(),
        ElevatedButton(
            onPressed: () {
              handleSubimit();
            },
            child: const Text('Confirmar'))
      ]),
    );
  }

  handleSubimit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      widget.callback(int.parse(_controllerNumberPageEdit.text));
      Navigator.pop(context);
    }
  }
}
