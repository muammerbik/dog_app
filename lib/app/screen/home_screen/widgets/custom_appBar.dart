import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarView extends StatefulWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final bool? centerTitle;
  final List<IconButton>? actionIcons;
  final Color? appBarColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final Color? iconColor;
  final IconButton? leadingIcon;

  const CustomAppBarView({
    super.key,
    this.appBarTitle,
    this.centerTitle,
    this.actionIcons,
    this.appBarColor,
    this.textColor,
    this.onTap,
    this.iconColor,
    this.leadingIcon,
  });

  @override
  State<CustomAppBarView> createState() => _CustomAppBarViewState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarViewState extends State<CustomAppBarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: ColorConstants.white,
        centerTitle: widget.centerTitle,
        backgroundColor: widget.appBarColor ?? Colors.white,
        leading: widget.leadingIcon,
        title: Text(
          widget.appBarTitle!,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        actions: widget.actionIcons ?? []);
  }
}
