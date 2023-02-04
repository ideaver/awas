import 'package:awas/res/utils/globals.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/view/report/camera_page.dart';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'res/utils/constants.dart';
import 'res/utils/routes.dart';

Future<void> main() async {
//custom Status bar and navigation bar color
  SystemChrome.setSystemUIOverlayStyle(darkStatusBar);
  //end region

// //initialized camera
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     logError(e.code, e.description);
//   }
// //end region

  runApp(const ProviderScope(child: MyApp()));
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
