import 'dart:io';
import 'dart:ui';

import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScrenGridContainer extends StatelessWidget {
  final int index;
  final String name;
  final File imageUrl;

  const HomeScrenGridContainer(
      {super.key,
      required this.index,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => GestureDetector(
        onTap: () {
          SetSelectedIndexEvent(selectedIndex: index);
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const HomeScreenAlertDialog());
        },
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: FileImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(imageUrl)),
                    color: Colors.black.withOpacity(0.24),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    name,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
