import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(TextConstants.dogApp),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
