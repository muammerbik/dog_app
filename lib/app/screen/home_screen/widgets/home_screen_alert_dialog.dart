import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
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
        content: Container(
          height: DeviceConfig.screenHeight! * 0.60,
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
                      backgroundColor: ColorConstants.transparent,
                      maxRadius: 24,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      )),
                ),
              ),
              SpaceHeight.m.value,
              Text(
                "Breed",
                style: TextStyle(
                    color: ColorConstants.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Divider(),
              Text(
                state.dogBreedsList[state.selectedIndex].name!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              Divider(),
              Text(
                "Sub Breed",
                style: TextStyle(
                    color: ColorConstants.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Divider(),
              state.dogBreedsList[state.selectedIndex].subBreeds!.isEmpty
                  ? const SizedBox()
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.dogBreedsList[state.selectedIndex]
                            .subBreeds!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Center(
                            child: Text(
                              state.dogBreedsList[state.selectedIndex]
                                  .subBreeds![index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
              SpaceHeight.m.value,
              HomeScreenGenerateButton(),
              SpaceHeight.m.value,
            ],
          ),
        ),
      ),
    );
  }
}
