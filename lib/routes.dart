import 'package:awas/view/settings/report_setting_page.dart';
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
  InboxPage.routeName: (context) => const InboxPage(),
  PointTransactionsPage.routeName: (context) => const PointTransactionsPage(),
  DashboardEmployeePage.routeName: (context) => const DashboardEmployeePage(),
  ReportLoadingPage.routeName: (context) => const ReportLoadingPage(),
  ReportFormPage.routeName: (context) => const ReportFormPage(),
  ReportListPage.routeName: (context) => const ReportListPage(),
  ReportFilterPage.routeName: (context) => const ReportFilterPage(),
  ReportDetailsPage.routeName: (context) => const ReportDetailsPage(),
  SettingsPage.employeeRouteName: (context) => const SettingsPage.employee(),
  PointSettingPage.routeName: (context) => const PointSettingPage(),
  ImportExportPage.routeName: (context) => const ImportExportPage(),
  ReportSettingPage.routeName: (context) => const ReportSettingPage(),
};
