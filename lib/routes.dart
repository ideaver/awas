import 'package:awas/view/user/user_filter_page.dart';
import 'package:awas/view/user/user_list_page.dart';
import 'package:flutter/material.dart';

import 'view/dashboard/dashboard_employee_page.dart';
import 'view/inbox_page.dart';
import 'view/login/forgot_password_page.dart';
import 'view/login/login_page.dart';
import 'view/login/terms_page.dart';
import 'view/menu_page.dart';
import 'view/report/report_list_page.dart';
import 'view/thank_you_page.dart';
import 'view/user/point_transactions_page.dart';
import 'view/user/profile_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/menu': (context) => const MenuPage(),
  '/login': (context) => const LoginPage(),
  '/forgot-password': (context) => const ForgotPasswordPage(),
  '/thank-you': (context) => ThankYouPage(
        event: Event.profileUpdatedSuccess,
      ),
  '/terms': (context) => const TermsPage(),
  '/profile': (context) => const ProfilePage(),
  '/user-list': (context) => const UserListPage(),
  '/user-filter': (context) => const UserFilterPage(),
  '/inbox': (context) => const InboxPage(),
  '/point-transactions': (context) => const PointTransactionsPage(),
  '/dashboard-employee': (context) => const DashboardEmployeePage(),
  '/report-list': (context) => const ReportListPage(),

  // '/dashboard-manager': (context) => DashboardManager(),
  // '/report': (context) => const RegisterScreen(),
  // '/report-form': (context) => spp(),
  // '/notification': (context) => health(),
  // '/setting': (context) => health()
};
