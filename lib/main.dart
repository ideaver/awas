import 'package:awas/view/thank_you_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'res/theme/colors/light_colors.dart';
import 'view/dashboard/dashboard_employee_page.dart';
import 'view/profile_page.dart';
import 'view/login/forgot_password_page.dart';
import 'view/login/login_page.dart';
import 'view/login/terms_page.dart';

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
        initialRoute: '/dashboard-employee',
        routes: {
          '/login': (context) => const LoginPage(),
          '/forgot-password': (context) => const ForgotPasswordPage(),
          '/thank-you': (context) => const ThankYouPage(),
          '/terms': (context) => const TermsPage(),
          '/profile': (context) => const ProfilePage(),
          '/dashboard-employee': (context) => DashboardEmployeePage(),
          // '/dashboard-manager': (context) => DashboardManager(),
          // '/report': (context) => const RegisterScreen(),
          // '/report-form': (context) => spp(),
          // '/notification': (context) => health(),
          // '/setting': (context) => health()
        });
  }
}
