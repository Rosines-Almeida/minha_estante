// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minha_estante/commons/components/app_bar_componet.dart';
import 'package:minha_estante/commons/components/body_components.dart';
import 'package:minha_estante/pages/tabs/bookcase_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: mudar o nome _conteudo
  final List<Widget> _conteudo = [
    const BookCasePage(),
  ];
//TODO: mudar os icones e nome
  final List<BottomNavigationBarItem> _abas = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Perfil')
  ];

  @override
  Widget build(BuildContext context) {
    return BodyComponent(
        items: _abas,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(18),
          padding: const EdgeInsets.only(top: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: BookCasePage(),
        ));
  }
}
