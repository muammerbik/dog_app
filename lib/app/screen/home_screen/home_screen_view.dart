import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:dogs_app/app/core/enums/app_padding.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_appbar.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_grid_container.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key});

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    var bloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: const HomeScreenAppbar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              bloc.state.searchController.text.isEmpty
                  ? Padding(
                      padding: AppPaddingAll.m.value,
                      child: GridView.builder(
                        itemCount: state.dogBreedsList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15),
                        itemBuilder: (context, index) => HomeScrenGridContainer(
                          index: index,
                          name: state.dogBreedsList[index].name!,
                          imageUrl: state.dogBreedsList[index].imagePath!,
                        ),
                      ),
                    )
                  : state.searchList.isEmpty
                      ? const Center(
                          child: Text(
                          TextConstants.notSearch,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ))
                      : Padding(
                          padding: AppPaddingAll.m.value,
                          child: GridView.builder(
                            itemCount: state.searchList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15),
                            itemBuilder: (context, index) =>
                                HomeScrenGridContainer(
                              index: index,
                              name: state.searchList[index].name!,
                              imageUrl: state.searchList[index].imagePath!,
                            ),
                          ),
                        ),
              Padding(
                padding: AppPaddingBottom.xxl.value,
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: HomeScreenTextField(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
