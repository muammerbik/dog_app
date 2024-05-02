import 'package:dogs_app/app/core/navigator_helper/navigator_helper.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_alert_dialog.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_appbar.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_generate_alert_dialog.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_grid_container.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeScreenAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
            itemBuilder: (context, index) => HomeScrenGridContainer(),
          ),
        ));
  }
}
