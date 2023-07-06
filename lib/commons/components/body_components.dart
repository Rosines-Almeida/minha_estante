import 'package:flutter/material.dart';
import 'package:minha_estante/commons/components/app_bar_componet.dart';

class BodyComponent extends StatelessWidget {
  final Widget child;
  final BottomNavigationBar? bar;
  const BodyComponent({super.key, required this.child, this.bar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: Container(
        child: child,
      ),
      bottomNavigationBar: bar,
    );
  }
}
