import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenGenerateAlertDialog extends StatelessWidget {
  const HomeScreenGenerateAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AlertDialog(
            surfaceTintColor: ColorConstants.transparent,
            backgroundColor: ColorConstants.transparent,
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(state
                          .dogBreedsList[state.selectedIndex].imagePath!))),
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
      ),
    );
  }
}
