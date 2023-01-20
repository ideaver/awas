import 'package:flutter/material.dart';

import 'view/settings/point_setting_page.dart';
import 'view/settings/settings_page.dart';
import '/view/report/report_form_page.dart';
import 'view/report/report_loading_page.dart';
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
import '/view/import_export_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/menu': (context) => const MenuPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
  ThankYouPage.profileUpdaterouteName: (context) =>
      ThankYouPage.profileUpdate(),
  TermsPage.routeName: (context) => const TermsPage(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  UserListPage.routeName: (context) => const UserListPage(),
  UserFilterPage.routeName: (context) => const UserFilterPage(),
  '/inbox': (context) => const InboxPage(),
  '/point-transactions': (context) => const PointTransactionsPage(),
  '/dashboard-employee': (context) => const DashboardEmployeePage(),
  '/report-offline-loading': (context) => const ReportLoadingPage(),
  '/report-form': (context) => const ReportFormPage(),
  '/report-list': (context) => const ReportListPage(),
  '/report-filter': (context) => const ReportFilterPage(),
  '/report-details': (context) => const ReportDetailsPage(),
  '/settings': (context) => const SettingsPage.employee(),
  '/point-setting': (context) => const PointSettingPage(),
  '/import-export': (context) => const ImportExportPage(),
};
