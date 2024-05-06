import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenGenerateButton extends StatelessWidget {
  const HomeScreenGenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => InkWell(
        onTap: () async {
          bloc.add(FetchRandomImageEvent(
            fetchRandomImage: state.dogBreedsList[state.selectedIndex].name!,
          ));
          await Future.delayed(const Duration(microseconds: 300)).whenComplete(
            () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => BlocBuilder<HomeBloc, HomeState>(
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
                          height: DeviceConfig.screenHeight! * 0.40,
                          width: DeviceConfig.screenWidth! * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  state.fetchImageName,
                                ),
                                fit: BoxFit.cover),
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
                                  child: const Text(TextConstants.cancel)),
                              ElevatedButton(
                                  onPressed: () {
                                    bloc.add(
                                      FetchRandomImageEvent(
                                        fetchRandomImage: state
                                            .dogBreedsList[state.selectedIndex]
                                            .name!,
                                      ),
                                    );
                                  },
                                  child: const Text(TextConstants.newGenerate)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          height: DeviceConfig.screenHeight! * 0.070,
          width: DeviceConfig.screenWidth! * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorConstants.greenShade600,
            border: Border.all(color: ColorConstants.white, width: 2),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              TextConstants.generate,
              style: TextStyle(color: ColorConstants.white),
            ),
          ),
        ),
      ),
    );
  }
}
