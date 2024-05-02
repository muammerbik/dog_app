import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_generate_alert_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreenGenerateButton extends StatelessWidget {
  const HomeScreenGenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => HomeScreenGenerateAlertDialog(),
        );
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Generate",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
