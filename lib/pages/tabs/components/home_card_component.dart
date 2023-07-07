import 'package:flutter/material.dart';
import 'package:minha_estante/app_routes.dart';
import 'package:minha_estante/commons/components/space_component.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/services/image_picker_service.dart';

class HomeCardComponent extends StatelessWidget {
  final BooksEntity item;
  final int index;
  const HomeCardComponent({super.key, required this.item, required this.index});

  Widget makeImage() {
    if (item.image != null) {
      return Image.memory(
        PickerService().decodeBase64(item.image!),
        fit: BoxFit.cover,
        height: 150,
      );
    }
    return const Icon(
      Icons.library_books_rounded,
      size: 150,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          // padding: const EdgeInsets.all(20),
          children: [
            Center(child: makeImage()),
            Divider(),
            const SpacerComponent(),
            Align(
              alignment: Alignment.center,
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SpacerComponent(),
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
      ),
    );
  }
}
