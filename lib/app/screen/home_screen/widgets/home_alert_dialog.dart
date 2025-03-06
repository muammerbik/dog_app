import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/enums/app_padding.dart';
import 'package:dogs_app/app/core/enums/app_radius.dart';
import 'package:dogs_app/app/core/enums/space.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_generate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAlertDialog extends StatelessWidget {
  const HomeAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => AlertDialog(
        backgroundColor: ColorConstants.white,
        surfaceTintColor: ColorConstants.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.m.value,
        ),
        content: SizedBox(
          height: state.dogBreedsList[state.selectedIndex].subBreeds!.isNotEmpty
              ? 0.52.sh
              : 0.52.sh,
          width: 0.72.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 0.22.sh,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      state.dogBreedsList[state.selectedIndex].imagePath!,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                  color: ColorConstants.white,
                ),
              ),
              SpaceHeight.m.value,
              Text(
                TextConstants.breed,
                style: TextStyle(
                  color: ColorConstants.greenShade600,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              Text(
                state.dogBreedsList[state.selectedIndex].name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              Text(
                TextConstants.subBreed,
                style: TextStyle(
                  color: ColorConstants.greenShade600,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              state.dogBreedsList[state.selectedIndex].subBreeds!.isEmpty
                  ? const SizedBox()
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.dogBreedsList[state.selectedIndex]
                            .subBreeds!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: AppPaddingHorizontal.s.value,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.greenShade300,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Padding(
                                padding: AppPaddingAll.m.value,
                                child: Text(
                                  state.dogBreedsList[state.selectedIndex]
                                      .subBreeds![index],
                                  style: TextStyle(
                                    color: ColorConstants.black,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              SpaceHeight.s.value,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 128.w,
                    height: 64.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: AppRadius.s.value,
                          ),
                          backgroundColor: ColorConstants.red),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        TextConstants.cancel,
                        style: TextStyle(color: ColorConstants.white),
                      ),
                    ),
                  ),
                  const HomeGenerateButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
