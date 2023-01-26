import 'package:camera/camera.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'res/utils/routes.dart';
import 'view/report/camera_page.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: LightColors.kBackgroundColor,
    statusBarBrightness: Brightness.dark,
    statusBarColor: LightColors.kBackgroundColor, // status bar color
  ));

  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.robotoTextTheme()),
        debugShowCheckedModeBanner: false,
        initialRoute: '/menu',
        routes: routes);
  }
}
