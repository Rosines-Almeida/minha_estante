import 'package:flutter/material.dart';
import 'package:minha_estante/components/app_bar_componet.dart';

class BodyComponent extends StatelessWidget {
  final Widget child;
  final List<BottomNavigationBarItem> items;
  const BodyComponent({super.key, required this.child, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: Container(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: items,
      ),
    );
  }
}
