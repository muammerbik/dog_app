import 'package:dogs_app/app/core/device_config/device_config.dart';
import 'package:dogs_app/app/core/enums/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/dog.png",
                height: DeviceConfig.screenHeight! * 0.17),
            Padding(
              padding: AppPaddingTop.l.value,
              child: SizedBox(
                width: DeviceConfig.screenWidth! * 0.30,
                child: LinearProgressIndicator(
                    value: animationController?.value ?? 0,
                    backgroundColor: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
