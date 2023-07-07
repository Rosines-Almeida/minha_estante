import 'package:flutter/material.dart';
import 'package:minha_estante/pages/tabs/components/profile_card_component.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:minha_estante/providers/config_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late BookcaseProvider store;
  late ConfigProvider storeConfig;

  @override
  void initState() {
    super.initState();
  }

  int setBookInProgress() {
    return store.listBook
        .where((e) => e.numberPageRead > 0 && e.numberPageRead != e.numberPage)
        .length;
  }

  int setBookNotInProgress() {
    return store.listBook.where((e) => e.numberPageRead == 0).length;
  }

  int setBookConcluded() {
    return store.listBook.where((e) => e.numberPageRead == e.numberPage).length;
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BookcaseProvider>(context);
    storeConfig = Provider.of<ConfigProvider>(context);

    final List<Map> bookCase = [
      {
        'title': ' Livros na Estante',
        'numberOfBook': store.listBook.length,
        'icon': Icons.bookmarks_rounded,
      },
      {
        'title': 'Lendo',
        'numberOfBook': setBookInProgress(),
        'icon': Icons.bookmark_rounded,
      },
      {
        'title': 'Concluídos',
        'numberOfBook': setBookConcluded(),
        'icon': Icons.bookmark_added_rounded
      },
      {
        'title': 'Ler depois',
        'numberOfBook': setBookNotInProgress(),
        'icon': Icons.bookmark_border_rounded
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
              maxHeight: 400,
            ),
            child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 20,
                ),
                itemCount: bookCase.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = bookCase.elementAt(index);
                  return ProfileCardComponent(
                    title: item['title'],
                    numberOfBook: item['numberOfBook'],
                    icon: item['icon'],
                  );
                }),
          ),
          Divider(),
          Row(
            children: [
              Text('Tema escuro'),
              Switch(
                value: storeConfig.tema == ThemeMode.dark,
                onChanged: (val) {
                  storeConfig.tema = val ? ThemeMode.dark : ThemeMode.light;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
