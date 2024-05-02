import 'dart:ui';

import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_alert_dialog.dart';
import 'package:flutter/material.dart';

class HomeScrenGridContainer extends StatelessWidget {
  const HomeScrenGridContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
          color: Colors.amber,
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
                  color: Colors.black.withOpacity(0.24),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Center(
                    child: Text(
                  "isimm geleeck",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
