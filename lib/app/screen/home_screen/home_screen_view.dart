import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_appbar.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_grid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return Scaffold(
        appBar: const HomeScreenAppbar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: state.dogBreedsList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) => HomeScrenGridContainer(
                name: state.dogBreedsList[index].name!,
                index:state.selectedIndex,
                imageUrl: state.dogBreedsList[index].imagePath!,
              ),
            ),
          ),
        ));
  }
}
