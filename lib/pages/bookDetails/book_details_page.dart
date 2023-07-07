import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minha_estante/commons/components/bar_progress_component.dart';
import 'package:minha_estante/commons/components/body_components.dart';
import 'package:minha_estante/commons/components/space_component.dart';
import 'package:minha_estante/commons/helpers/calculate_percetage.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/pages/bookDetails/book_details_edit_dialog.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:minha_estante/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({
    super.key,
  });

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  late BooksEntity item;

  late bool editNumber = false;
  late BookcaseProvider store;
  late int index;
  late double valuePercentage = 0;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  double toCalculatePercetage() {
    valuePercentage = calculatePercetage(item.numberPageRead, item.numberPage);

    setState(() {
      valuePercentage = valuePercentage;
    });
    return valuePercentage;
  }

  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());

      store.selecionado = item;
      store.selecionado!.image = base64;
      store.updateItemBook(index);
    }
  }

  void removeItemBook() {
    store.selecionado = item;

    store.removeItemBook(index);
    Navigator.pop(context);
  }

  Widget makeImage() {
    if (item.image != null) {
      return Image.memory(
        PickerService().decodeBase64(item.image!),
        fit: BoxFit.cover,
      );
    }
    return const Icon(
      Icons.image_search,
      size: 100,
    );
  }

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

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      elevation: 4.0,
                      child: Stack(
                        children: [
                          Container(
                            width: 200,
                            height: 300,
                            color: Colors.amber[100],
                            child: makeImage(),
                          ),
                          Positioned(
                            bottom: 18,
                            right: 18,
                            //todo: add icon
                            child: IconButton(
                              onPressed: () {
                                onEditImage();
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 24,
                            ),
                          ),
                        ],
                      )),
                  const SpacerComponent(
                    isHorizontal: true,
                    size: 30,
                  ),
                  Container(
                      width: 200,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SpacerComponent(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SpacerComponent(
                              size: 20,
                            ),
                            BarProgressComponents(
                              index: index,
                            ),
                            const SpacerComponent(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    '${toCalculatePercetage().toStringAsFixed(0)} %'),
                                const SpacerComponent(
                                  isHorizontal: true,
                                ),
                                Text(
                                    '${item.numberPageRead}/${item.numberPage}'),
                              ],
                            )
                          ])),
                ],
              ),
              const SpacerComponent(),
              const Divider(),
              const SpacerComponent(
                size: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Total de páginas: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SpacerComponent(
                        isHorizontal: true,
                        size: 5,
                      ),
                      Text('${item.numberPage}')
                    ],
                  ),
                  const SpacerComponent(),
                  Row(children: [
                    const Text(
                      'Lidas:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SpacerComponent(
                      isHorizontal: true,
                      size: 5,
                    ),
                    Text(item.numberPageRead.toString()),
                  ]),
                  const SpacerComponent(),
                  const Divider(),
                  const SpacerComponent(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          store.selecionado = item;
                          openModalUpdateItemBook(context);
                        },
                        icon: Icon(Icons.edit_note_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          store.selecionado = item;
                          removeItemBook();
                        },
                        icon: Icon(Icons.bookmark_remove_outlined),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
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
              store.selecionado = item;
              store.selecionado?.numberPageRead = number;
              store.updateItemBook(index);
            })
          ],
        );
      },
    );
  }
}
