import 'package:flutter/material.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/pages/tabs/bookcase_form_dialog.dart';
import 'package:minha_estante/pages/tabs/components/home_card_component.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:provider/provider.dart';

class BookCasePage extends StatefulWidget {
  const BookCasePage({super.key});

  @override
  State<BookCasePage> createState() => _BookCasePageState();
}

class _BookCasePageState extends State<BookCasePage> {
  late BookcaseProvider store;
  final List<BooksEntity> listBooks = [
    BooksEntity(
      numberPage: 0,
      state: 'jjj',
      title: 'titulo 2',
      uuid: 'ss',
    ),
    BooksEntity(
      numberPage: 0,
      state: 'jjj',
      title: 'titulo 2',
      uuid: 'ss',
    )
  ];

  void openFormDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const SimpleDialog(
            children: [BookCaseFormDialog()],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BookcaseProvider>(context);
    return Column(children: [
      Flexible(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: listBooks.length,
          itemBuilder: (BuildContext context, int index) {
            final item = store.listBook.elementAt(index);
            return HomeCardComponent(
              item: item,
            );
          },
        ),
      ),
      Center(
        child: FloatingActionButton(
          onPressed: openFormDialog,
          child: const Icon(Icons.add),
        ),
      )
    ]);
  }
}
