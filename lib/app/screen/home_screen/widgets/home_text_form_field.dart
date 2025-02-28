import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTextFormField extends StatelessWidget {
  const HomeTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 56.h),
        child: TextFormField(
          cursorColor: ColorConstants.black,
          autofocus: false,
          onTap: () {
            FocusScope.of(context).requestFocus();
          },
          onChanged: (value) {
            bloc.add(
              const SearchDogBreedsEvent(),
            );
          },
          controller: bloc.state.searchController,
          decoration: InputDecoration(
            hintText: TextConstants.search,
            filled: true,
            fillColor: ColorConstants.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.black38),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.black38),
            ),
          ),
        ),
      ),
    );
  }
}
