import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BookcaseProvider>(context);
    return Column(children: [
      Flexible(
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemCount: store.listBook.length,
          itemBuilder: (BuildContext context, int index) {
            final item = store.listBook.elementAt(index);
            return HomeCardComponent(
              item: item,
              index: index,
            );
          },
        ),
      ),
      Center(
        child: FloatingActionButton(
          onPressed: () {
            store.openFormDialog(context);
          },
          child: const Icon(Icons.add),
        ),
      )
    ]);
  }
}
