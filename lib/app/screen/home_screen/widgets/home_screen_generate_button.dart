import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_generate_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenGenerateButton extends StatelessWidget {
  const HomeScreenGenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => InkWell(
        onTap: () async {
          bloc.add(FetchRandomImageEvent(
            fetchRandomImage: state.dogBreedsList[state.selectedIndex].name!,
          ));
          await Future.delayed(Duration(microseconds: 300)).whenComplete(
            () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) =>
                            HomeScreenGenerateAlertDialog(),
                      ),);
            },
          );
        },
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  state.fetchImageName,
                ),
                fit: BoxFit.contain),
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
      ),
    );
  }
}
