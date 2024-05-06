import 'package:dogs_app/app/core/constants/color_constants.dart';
import 'package:dogs_app/app/core/constants/text_constants.dart';
import 'package:dogs_app/app/core/get_it/get_it.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/splash%20screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  setupGetIT();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorConstants.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator.get<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme:
                const AppBarTheme(backgroundColor: ColorConstants.white),
            scaffoldBackgroundColor: ColorConstants.white),
        debugShowCheckedModeBanner: false,
        title: TextConstants.dogApp,
        home: const SplashScreenView(),
      ),
    );
  }
}
