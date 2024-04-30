import 'package:dogs_app/app/core/get_it/get_it.dart';
import 'package:dogs_app/app/core/navigator_helper/navigator_helper.dart';
import 'package:dogs_app/app/screen/home_screen/home_screen_view.dart';
import 'package:dogs_app/app/screen/splash%20screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetit();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
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
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation.navigationKey,
      title: 'Dog Apps',
      home: HomeScreenView(),
    );
  }
}
