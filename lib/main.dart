import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor: LightColors.Blue, // navigation bar color
  //   statusBarColor: LightColors.Blue, // status bar color
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
