import 'package:flutter/material.dart';

class HomeScreenTextField extends StatelessWidget {
  const HomeScreenTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 250,
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search ",
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          suffix: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
