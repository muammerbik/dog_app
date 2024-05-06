import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';

class HomeScreenTextField extends StatelessWidget {
  const HomeScreenTextField({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => SizedBox(
        height: DeviceConfig.screenHeight! * 0.058,
        width: DeviceConfig.screenWidth! * 0.60,
        child: TextFormField(
          onChanged: (value) {
            bloc.add(const SearchDogBreedsEvent());
          },
          controller: bloc.state.searchController,
          decoration: const InputDecoration(
            hintText: TextConstants.search,
            filled: true,
            fillColor: ColorConstants.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
