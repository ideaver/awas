import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'res/theme/colors/light_colors.dart';
import 'view/login/login_page.dart';
import 'view/login/terms_page.dart';

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
            textTheme: GoogleFonts.robotoTextTheme()),
        debugShowCheckedModeBanner: false,
        initialRoute: '/terms',
        routes: {
          '/login': (context) => const LoginPage(),
          // '/forgot-password': (context) => home(),
          // '/email-confirmation': (context) => home(),
          '/terms': (context) => TermsPage(),
          // '/profile': (context) => home(),
          // '/dashboard-employee': (context) => DashboardEmployee(),
          // '/dashboard-manager': (context) => DashboardManager(),
          // '/report': (context) => const RegisterScreen(),
          // '/report-form': (context) => spp(),
          // '/notification': (context) => health(),
          // '/setting': (context) => health()
        });
  }
}
