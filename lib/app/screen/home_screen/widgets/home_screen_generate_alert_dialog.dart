import 'package:flutter/material.dart';

class HomeScreenGenerateAlertDialog extends StatelessWidget {
  const HomeScreenGenerateAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonBar(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(onPressed: () {}, child: Text("new generate")),
              ],
            )
          ],
        )
      ],
    );
  }
}
