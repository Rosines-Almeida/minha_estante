import 'package:flutter/material.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late BookcaseProvider store;
  late int inProgress;
  late int notInProgres;

  //metodo para pecorrer quantos estão com paginas lidas
  @override
  void initState() {
    inProgress = 0;
    notInProgres = 0;
    // setBookInProgress();
    // TODO: implement initState
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
  };




  @override
  Widget build(BuildContext context) {
    store = Provider.of<BookcaseProvider>(context);
    //   return Text(
    //       'oi ${store.listBook.length}, ${setBookInProgress()}, ${setBookNotInProgress()}, ${setBookConcluded()}');
    // }

      final List<Map> item = [
    { 
      'title':' Livros na Estante',
      'numberOfBook': store.listBook.length,
    },
     { 
      'title':'Lendo',
      'numberOfBook': setBookInProgress(),
    },
   ]  ;

    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          Wrap(children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[300]!,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10), // Raio do canto
              ),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300]!,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book_online_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'Livros Concluídos',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      store.listBook.length.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ]),
          Wrap(children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[300]!,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10), // Raio do canto
              ),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300]!,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book_online_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'Livros Concluídos',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      store.listBook.length.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ]);
  }
}
