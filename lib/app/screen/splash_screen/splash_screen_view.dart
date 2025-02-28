import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/get_it/get_it.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.succes) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreenView(),
            ),
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
                  width: 128.w,
                  height: 128.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "assets/icons/dog.png",
                      ),
                    ),
                  ),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.status == HomeStatus.loading) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 120.w, vertical: 12.h),
                        child: LinearProgressIndicator(
                          color: ColorConstants.orangeColor,
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
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
