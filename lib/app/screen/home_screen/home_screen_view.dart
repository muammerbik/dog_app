import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/enums/app_padding.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/custom_appBar.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_container.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_text_form_field.dart';
import 'package:dogs_app/app/screen/settings_screen/settings_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBarView(
          appBarTitle: TextConstants.homeTitle,
          centerTitle: true,
          actionIcons: [
            IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreenView(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Stack(
              children: [
                bloc.state.searchController.text.isEmpty
                    ? Padding(
                        padding: AppPaddingAll.xl.value,
                        child: GridView.builder(
                          padding: EdgeInsets.only(bottom: 81.h),
                          itemCount: state.dogBreedsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15),
                          itemBuilder: (context, index) => HomeContainer(
                            index: index,
                            name: state.dogBreedsList[index].name!,
                            imageUrl: state.dogBreedsList[index].imagePath!,
                          ),
                        ),
                      )
                    : state.searchList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 48.sp,
                                  color: ColorConstants.grey600,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  TextConstants.notSearch,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstants.grey700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: AppPaddingAll.m.value,
                            child: GridView.builder(
                              padding: EdgeInsets.only(bottom: 81.h),
                              itemCount: state.searchList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15),
                              itemBuilder: (context, index) => HomeContainer(
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
                    child: HomeTextFormField(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
