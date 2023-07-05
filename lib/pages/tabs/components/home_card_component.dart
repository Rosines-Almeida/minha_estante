import 'package:flutter/material.dart';
import 'package:minha_estante/entities/books_entity.dart';

class HomeCardComponent extends StatelessWidget {
  final BooksEntity item;
  const HomeCardComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            Container(
              height: 200.0,
              child: Text('image'),
            ),
            //  Container(
            //    height: 200.0,
            //    child: Ink.image(
            //      image: cardImage,
            //      fit: BoxFit.cover,
            //    ),
            //  ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(item.title),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('Ver Mais'),
                  onPressed: () {/* ... */},
                ),
              ],
            )
          ],
        ));
  }

  toList() {}
}
