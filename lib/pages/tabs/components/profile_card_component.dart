import 'package:flutter/material.dart';
import 'package:minha_estante/commons/components/space_component.dart';

class ProfileCardComponent extends StatelessWidget {
  final int numberOfBook;
  final String title;
  final IconData icon;

  const ProfileCardComponent(
      {super.key,
      required this.numberOfBook,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(children: [
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
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      SpacerComponent(
                        isHorizontal: true,
                        size: 4,
                      ),
                      Text(
                        title,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
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
                    numberOfBook.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ]));
  }
}
