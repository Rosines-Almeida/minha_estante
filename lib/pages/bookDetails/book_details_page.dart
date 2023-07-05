import 'package:flutter/material.dart';
import 'package:minha_estante/components/bar_progress_component.dart';
import 'package:minha_estante/components/body_components.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/pages/bookDetails/book_details_edit_dialog.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:provider/provider.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({
    super.key,
    // this.item,
  });

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  BooksEntity? item;

  late bool editNumber = false;
  late BookcaseProvider store;
  late int index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;

    if (arg != null) {
      index = arg as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BookcaseProvider>(context);
    item = store.listBook.elementAt(index);
    return BodyComponent(
      // TODO: alterar o itens
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Perfil')
      ],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Card(
                      elevation: 4.0,
                      child: Container(
                        height: 200.0,
                        width: 400,
                        child: Text('image'),
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item!.title,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const BarProgressComponents(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('90 %'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('${item!.numberPageRead}/${item!.numberPage}'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total de páginas: ${item!.numberPage}'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('Lidas:'),
                    Text(item!.numberPageRead.toString()),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      store.selecionado = item;
                      openModalUpdateItemBook(context);
                    },
                    icon: Icon(Icons.edit))
              ],
            )
          ],
        ),
      ),
    );
  }

  void openModalUpdateItemBook(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            BookDetailsEditDialog(callback: (number) {
              store.selecionado?.numberPageRead = number;
              store.atualizarItemAfazer(index);
            })
          ],
        );
      },
    );
  }
}
