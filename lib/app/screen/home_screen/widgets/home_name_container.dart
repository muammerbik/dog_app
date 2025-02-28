import 'dart:io';
import 'dart:ui';
import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNameContainer extends StatelessWidget {
  final int index;
  final String name;
  final File imageUrl;

  const HomeNameContainer(
      {super.key,
      required this.index,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => GestureDetector(
        onTap: () {
          context
              .read<HomeBloc>()
              .add(SetSelectedIndexEvent(selectedIndex: index));

          context
              .read<HomeBloc>()
              .add(FetchRandomImageEvent(fetchRandomImage: name));

          showDialog(
            context: context,
            builder: (context) => const HomeAlertDialog(),
          );
        },
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: FileImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 24,
                  decoration: BoxDecoration(
                    color: ColorConstants.black.withOpacity(0.24),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 16.sp, color: ColorConstants.white),
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
