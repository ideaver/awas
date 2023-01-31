import 'package:camera/camera.dart';
import '/view/report/camera_page.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'res/utils/constants.dart';
import 'res/utils/routes.dart';

Future<void> main() async {
//custom Status bar and navigation bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: LightColors.kBackgroundColor,
    statusBarBrightness: Brightness.dark,
    statusBarColor: LightColors.kBackgroundColor, // status bar color
  ));
  //end region

//initialized camera
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
//end region

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
