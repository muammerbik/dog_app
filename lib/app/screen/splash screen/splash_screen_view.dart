import 'package:dogs_app/app/core/get_it/get_it.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStatus.succes) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreenView()),
            );
          }
        },
        bloc: locator.get<HomeBloc>()..add(const FetchDogBreedsEvent()),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/img_appicon.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
