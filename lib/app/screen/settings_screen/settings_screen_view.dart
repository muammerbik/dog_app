import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:dogs_app/app/data/models/settings_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreenView extends StatelessWidget {
  const SettingsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarView(
        appBarTitle: TextConstants.settingsTitle,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.separated(
          itemBuilder: (context, index) {
            SettingsModel settings = settingsModelList[index];
            return ListTile(
              leading: settings.icon,
              trailing: const Icon(Icons.arrow_forward),
              title: Text(settings.title),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0,
              indent: 18,
            );
          },
          itemCount: settingsModelList.length,
        ),
      ),
    );
  }
}
