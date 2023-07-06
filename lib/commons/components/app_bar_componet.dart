import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Minha Estande virtual'),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(16),
          child: CircleAvatar(
            child: Text('RA'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
