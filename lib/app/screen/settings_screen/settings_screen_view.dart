import 'package:flutter/material.dart';
import 'package:dogs_app/app/screen/settings_screen/widgets/setting_screen_appbar.dart';
import 'package:dogs_app/app/data/models/settings_model.dart';

class SettingsScreenView extends StatelessWidget {
  const SettingsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsScreenAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.separated(
          itemBuilder: (context, index) {
            SettingsModel settings = settingsModelList[index];
            return ListTile(
              leading: settings.icon,
              trailing: Icon(Icons.arrow_back),
              title: Text(settings.title),
              onTap: () {
              
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
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
