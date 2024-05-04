import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/screen/settings_screen/settings_screen_view.dart';
import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(TextConstants.dogApp),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingsScreenView(),
              ));
            },
            icon: const Icon(Icons.settings))
      ],
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
