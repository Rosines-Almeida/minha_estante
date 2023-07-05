import 'package:flutter/material.dart';
import 'package:minha_estante/app_routes.dart';
import 'package:minha_estante/entities/books_entity.dart';

class HomeCardComponent extends StatelessWidget {
  final BooksEntity item;
  final int index;
  const HomeCardComponent({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          item.image == null
              ? Container(
                  height: 400.0,
                  color: Colors.grey[300],
                  child: Center(
                      child: Text(
                    'Adicione uma imagem',
                    style: TextStyle(
                        color: Colors.grey[850], fontWeight: FontWeight.w700),
                  )),
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(item.title),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('Ver Mais'),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.bookDetails,
                      arguments: index);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
