import 'package:flutter/material.dart';

import '/view/dashboard/dashboard_employee_page.dart';
import '/view/dashboard/dashboard_manager_page.dart';
import '/view/login/forgot_password_page.dart';
import '/view/login/login_page.dart';
import '/view/login/terms_page.dart';
import '/view/menu_page.dart';
import '/view/report/report_details_page.dart';
import '/view/report/report_filter_page.dart';
import '/view/report/report_form_page.dart';
import '/view/report/report_list_page.dart';
import '/view/report/report_loading_page.dart';
import '/view/settings/import_export_page.dart';
import '/view/settings/observation/observation_card_setting_page.dart';
import '/view/settings/observation/observation_checklist_setting_page.dart';
import '/view/settings/point_setting_page.dart';
import '/view/settings/report_setting_page.dart';
import '/view/settings/settings_page.dart';
import '/view/thank_you_page.dart';
import '/view/user/inbox_page.dart';
import '/view/user/point_transactions_page.dart';
import '/view/user/user_page.dart';
import '/view/user/user_filter_page.dart';
import '/view/user/user_list_page.dart';
import '/view/user/create_user_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/menu': (context) => const MenuPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
  ThankYouPage.profileUpdaterouteName: (context) =>
      ThankYouPage.profileUpdate(),
  TermsPage.routeName: (context) => const TermsPage(),
  UserPage.routeName: (context) => const UserPage(),
  UserListPage.routeName: (context) => const UserListPage(),
  UserFilterPage.routeName: (context) => const UserFilterPage(),
  CreateUserPage.routeName: (context) => const CreateUserPage(),
  InboxPage.routeName: (context) => const InboxPage(),
  PointTransactionsPage.routeName: (context) => const PointTransactionsPage(),
  DashboardEmployeePage.routeName: (context) => const DashboardEmployeePage(),
  DashboardManagerPage.routeName: (context) => const DashboardManagerPage(),
  ReportLoadingPage.routeName: (context) => const ReportLoadingPage(),
  ReportFormPage.routeName: (context) => const ReportFormPage(),
  ReportListPage.routeName: (context) => const ReportListPage(),
  ReportFilterPage.routeName: (context) => const ReportFilterPage(),
  ReportDetailsPage.routeName: (context) => const ReportDetailsPage(),
  SettingsPage.employeeRouteName: (context) => const SettingsPage.employee(),
  PointSettingPage.routeName: (context) => const PointSettingPage(),
  ImportExportPage.routeName: (context) => const ImportExportPage(),
  ReportSettingPage.routeName: (context) => const ReportSettingPage(),
  ObservationCardSettingPage.routeName: (context) =>
      const ObservationCardSettingPage(),
  ObservationChecklistSettingPage.routeName: (context) =>
      const ObservationChecklistSettingPage()
};
