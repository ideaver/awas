import 'package:flutter/material.dart';

import '/view/settings/settings_page.dart';
import '/view/report/report_form_page.dart';
import '/view/report/offline_submitting_loading_page.dart';
import '/view/report/report_details_page.dart';
import '/view/user/user_filter_page.dart';
import '/view/user/user_list_page.dart';
import 'view/dashboard/dashboard_employee_page.dart';
import 'view/inbox_page.dart';
import 'view/login/forgot_password_page.dart';
import 'view/login/login_page.dart';
import 'view/login/terms_page.dart';
import 'view/menu_page.dart';
import 'view/report/report_filter_page.dart';
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
  '/report-offline-loading': (context) => const OfflineSubmittingLoadingPage(),
  '/report-form': (context) => const ReportFormPage(),
  '/report-list': (context) => const ReportListPage(),
  '/report-filter': (context) => const ReportFilterPage(),
  '/report-details': (context) => const ReportDetailsPage(),
  '/settings': (context) => const SettingsPage(),
};
