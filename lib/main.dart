import 'package:awas/view/report/report_list_page.dart';
import 'package:awas/view/thank_you_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'res/theme/colors/light_colors.dart';
import 'res/widgets/kelevated_button.dart';
import 'view/dashboard/dashboard_employee_page.dart';
import 'view/user/point_transactions_page.dart';
import 'view/user/profile_page.dart';
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
        initialRoute: '/report-list',
        routes: {
          '/login': (context) => const LoginPage(),
          '/forgot-password': (context) => const ForgotPasswordPage(),
          '/thank-you': (context) => ThankYouPage(
                event: Event.profileUpdatedSuccess,
              ),
          '/terms': (context) => const TermsPage(),
          '/profile': (context) => const ProfilePage(),
          '/point-transactions': (context) => const PointTransactionsPage(),
          '/dashboard-employee': (context) => const DashboardEmployeePage(),
          '/report-list': (context) => ReportListPage(),
          // '/dashboard-manager': (context) => DashboardManager(),
          // '/report': (context) => const RegisterScreen(),
          // '/report-form': (context) => spp(),
          // '/notification': (context) => health(),
          // '/setting': (context) => health()
        });
  }
}
