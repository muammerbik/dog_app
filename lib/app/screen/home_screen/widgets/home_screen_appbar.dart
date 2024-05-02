import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dog App"),
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
