import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:dogs_app/app/core/get_it/get_it.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
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
        backgroundColor: ColorConstants.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: DeviceConfig.screenHeight! * 0.50,
                  height: DeviceConfig.screenHeight! * 0.20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "assets/images/dog.png",
                      ),
                    ),
                  ),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.status == HomeStatus.loading) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: LinearProgressIndicator(
                          color: ColorConstants.greenShade300,
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
