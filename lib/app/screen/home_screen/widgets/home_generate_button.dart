import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/enums/app_radius.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeGenerateButton extends StatelessWidget {
  const HomeGenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
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
                barrierDismissible: true,
                builder: (context) => BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) => Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AlertDialog(
                        surfaceTintColor: ColorConstants.black,
                        backgroundColor: ColorConstants.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.s.value,
                        ),
                        contentPadding: EdgeInsets.zero,
                        content: Container(
                          height: 580.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                                image: NetworkImage(
                                  state.fetchImageName,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: AppRadius.s.value,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                TextConstants.cancel,
                                style: TextStyle(color: ColorConstants.black),
                              ),
                            ),
                            SizedBox(
                              width: 24.w,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: AppRadius.s.value,
                                ),
                              ),
                              onPressed: () {
                                bloc.add(
                                  FetchRandomImageEvent(
                                    fetchRandomImage: state
                                        .dogBreedsList[state.selectedIndex]
                                        .name!,
                                  ),
                                );
                              },
                              child: const Text(
                                TextConstants.newGenerate,
                                style: TextStyle(color: ColorConstants.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          height: 64.h,
          width: 128.w,
          decoration: BoxDecoration(
            borderRadius: AppRadius.m.value,
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
