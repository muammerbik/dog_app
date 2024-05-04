import 'package:flutter/material.dart';

class SettingsScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Settings"),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
