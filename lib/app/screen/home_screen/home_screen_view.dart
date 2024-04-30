import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppbar(),
      body: Container(),
    );
  }
}
