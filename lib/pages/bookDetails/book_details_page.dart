import 'package:flutter/material.dart';
import 'package:minha_estante/components/bar_progress_component.dart';
import 'package:minha_estante/components/body_components.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BodyComponent(
      // TODO: alterar o itens
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Perfil')
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Card(
                  elevation: 4.0,
                  child: Container(
                    height: 200.0,
                    width: 400,
                    child: Text('image'),
                  )),
              const Column(
                children: [
                  Text(
                    'Titulo',
                  ),
                  BarProgressComponents(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('90 %'),
                      Text('200/240'),
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total de páginas: 0 '),
              Text('Lidas: 0'),
            ],
          )
        ],
      ),
    );
  }
}
