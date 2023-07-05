import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';

class BookDetailsEditDialog extends StatefulWidget {
  const BookDetailsEditDialog({super.key, required this.callback});
  final void Function(int numberPage) callback;

  @override
  State<BookDetailsEditDialog> createState() => _BookDetailsEditDialogState();
}

class _BookDetailsEditDialogState extends State<BookDetailsEditDialog> {
  final _controllerNumberPageEdit = TextEditingController();
  late BookcaseProvider store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text('Atualize os dados'),
        TextFormField(
          controller: _controllerNumberPageEdit,
          decoration: const InputDecoration(
            labelText: 'Numero de páginas lidas',
          ),
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
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
            onPressed: () {
              widget.callback(int.parse(_controllerNumberPageEdit.text));
              Navigator.pop(context);
            },
            child: Text('Confirmar'))
      ]),
    );
  }
}
