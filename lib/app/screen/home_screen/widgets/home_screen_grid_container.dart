import 'dart:io';
import 'dart:ui';

import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScrenGridContainer extends StatelessWidget {
  final int index;
  final String name;
  final File imageUrl;

  const HomeScrenGridContainer(
      {super.key,
      required this.index,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => GestureDetector(
        onTap: () {
          context
              .read<HomeBloc>()
              .add(SetSelectedIndexEvent(selectedIndex: index));

          context
              .read<HomeBloc>()
              .add(FetchRandomImageEvent(fetchRandomImage: name));
          // Alert dialogu göster
          showDialog(
            context: context,
            builder: (context) => const HomeScreenAlertDialog(),
          );
        },
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: FileImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: DeviceConfig.screenHeight! * 0.032,
                  decoration: BoxDecoration(
                    color: ColorConstants.black.withOpacity(0.24),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16, color: ColorConstants.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
