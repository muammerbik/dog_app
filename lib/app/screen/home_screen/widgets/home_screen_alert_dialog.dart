import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:dogs_app/app/core/enums/app_padding.dart';
import 'package:dogs_app/app/core/enums/app_radius.dart';
import 'package:dogs_app/app/core/enums/space.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_generate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenAlertDialog extends StatelessWidget {
  const HomeScreenAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => AlertDialog(
        backgroundColor: ColorConstants.white,
        surfaceTintColor: ColorConstants.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.m.value,
        ),
        content: SizedBox(
          height: state.dogBreedsList[state.selectedIndex].subBreeds!.isNotEmpty
              ? DeviceConfig.screenHeight! * 0.61
              : DeviceConfig.screenHeight! * 0.55,
          width: DeviceConfig.screenWidth! * 0.67,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: DeviceConfig.screenWidth! * 0.60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(
                          state.dogBreedsList[state.selectedIndex].imagePath!,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: ColorConstants.white),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                      backgroundColor: ColorConstants.white,
                      maxRadius: 20,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close,
                            color: ColorConstants.black),
                      )),
                ),
              ),
              SpaceHeight.m.value,
              Text(
                TextConstants.breed,
                style: TextStyle(
                    color: ColorConstants.greenShade600,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Divider(),
              Text(
                state.dogBreedsList[state.selectedIndex].name!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              const Divider(),
              Text(
                TextConstants.subBreed,
                style: TextStyle(
                    color: ColorConstants.greenShade600,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Divider(),
              state.dogBreedsList[state.selectedIndex].subBreeds!.isEmpty
                  ? const SizedBox()
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.dogBreedsList[state.selectedIndex]
                            .subBreeds!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: AppPaddingBottom.s.value,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorConstants.greenShade300,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: AppPaddingAll.m.value,
                                child: Text(
                                  state.dogBreedsList[state.selectedIndex]
                                      .subBreeds![index],
                                  style: const TextStyle(
                                      color: ColorConstants.black,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              SpaceHeight.s.value,
              const HomeScreenGenerateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
