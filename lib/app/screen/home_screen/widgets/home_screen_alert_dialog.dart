import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:dogs_app/app/core/enums/app_radius.dart';
import 'package:dogs_app/app/core/enums/space.dart';
import 'package:dogs_app/app/screen/home_screen/widgets/home_screen_generate_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreenAlertDialog extends StatelessWidget {
  const HomeScreenAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return AlertDialog(
      backgroundColor: ColorConstants.white,
      surfaceTintColor: ColorConstants.white,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.m.value,
      ),
      content: Container(
        height: DeviceConfig.screenHeight! * 0.60,
        width: DeviceConfig.screenWidth! * 0.67,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: DeviceConfig.screenWidth! * 0.60,
              decoration: BoxDecoration(
                color: ColorConstants.green,
                borderRadius: AppRadius.m.value,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                    backgroundColor: ColorConstants.transparent,
                    maxRadius: 24,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    )),
              ),
            ),
            SpaceHeight.m.value,
            Text(
              "Breed",
              style: TextStyle(
                  color: ColorConstants.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Divider(),
            Text(
              "Dog Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            Divider(),
            Text(
              "Sub Breed",
              style: TextStyle(
                  color: ColorConstants.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Divider(),
            Text("EĞER ALT IRKLAR VARSA BURAYA LİSTELENSİN YOKSA BU ALAN BOŞ"),
            SpaceHeight.m.value,
            HomeScreenGenerateButton(),
          ],
        ),
      ),
    );
  }
}
