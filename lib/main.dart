import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'res/theme/colors/light_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.Blue, // navigation bar color
    statusBarColor: LightColors.Blue, // status bar color
  ));
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
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => home(),
          '/forgot-password': (context) => home(),
          '/email-confirmation': (context) => home(),
          '/terms': (context) => home(),
          '/profile': (context) => home(),
          '/dashboard-employee': (context) => DashboardEmployee(),
          '/dashboard-manager': (context) => DashboardManager(),
          '/report': (context) => const RegisterScreen(),
          '/report-form': (context) => spp(),
          '/notification': (context) => health(),
          '/setting': (context) => health()
        });
  }
}
