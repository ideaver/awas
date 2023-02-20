import 'package:awas/res/widgets/kbottom_navigation_bar.dart';
import 'package:awas/view/company/company_details_page.dart';
import 'package:awas/view/company/company_onboarding_page.dart';
import 'package:awas/view/dashboard/dashboard_admin_page.dart';
import 'package:awas/view/menu_page.dart';
import 'package:awas/view/report/image_viewer_page.dart';
import 'package:awas/view/report/report_location.dart';
import 'package:awas/view/settings/observation/observation_add_edit_page.dart';
import 'package:awas/view/settings/observation/observation_detail_page.dart';
import 'package:awas/view/settings/risk_level_settings_page.dart';
import 'package:awas/view/user/chat_room_page.dart';
import 'package:flutter/material.dart';

import '../../view/report/camera_page.dart';
import '../../view/settings/observation/observation_event_details_page.dart';
import '/view/dashboard/dashboard_employee_page.dart';
import '/view/dashboard/dashboard_manager_page.dart';
import '/view/login/forgot_password_page.dart';
import '/view/login/login_page.dart';
import '/view/login/terms_page.dart';
import '../../view/all_screen_page.dart';
import '/view/report/report_details_page.dart';
import '/view/report/report_filter_page.dart';
import '/view/report/report_form_page.dart';
import '/view/report/report_list_page.dart';
import '/view/report/report_loading_page.dart';
import '/view/settings/import_export_page.dart';
import '../../view/settings/observation/observation_event_setting_page.dart';
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
  '/all-screen': (context) => const AllScreenPage(),
  KbottomNavigationBar.routeName: (context) => const KbottomNavigationBar(),
  LoginPage.employeeRoleRouteName: (context) => const LoginPage.employeeRole(),
  LoginPage.managerRoleRouteName: (context) => const LoginPage.managerRole(),
  LoginPage.superUserRoleRouteName: (context) =>
      const LoginPage.superUserRole(),
  ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
  ThankYouPage.profileUpdaterouteName: (context) =>
      ThankYouPage.profileUpdated(),
  TermsPage.routeName: (context) => const TermsPage(),
  UserPage.editModerouteName: (context) => const UserPage.edit(),
  UserPage.viewAsMeRouteName: (context) => const UserPage.viewAsMe(),
  UserPage.viewAsOtherRouteName: (context) => const UserPage.viewAsOther(),
  UserListPage.routeName: (context) => const UserListPage(),
  UserFilterPage.routeName: (context) => const UserFilterPage(),
  CreateUserPage.routeName: (context) => const CreateUserPage(),
  ChatRoomPage.routeName: (context) => const ChatRoomPage(),
  InboxPage.routeName: (context) => const InboxPage(),
  PointTransactionsPage.viewAsMeRouteName: (context) =>
      const PointTransactionsPage.viewAsMe(),
  DashboardEmployeePage.routeName: (context) => const DashboardEmployeePage(),
  DashboardManagerPage.routeName: (context) => const DashboardManagerPage(),
  CameraPage.routeName: (context) => const CameraPage(),
  ReportLoadingPage.routeName: (context) => const ReportLoadingPage(),
  ReportFormPage.routeName: (context) => const ReportFormPage(),
  ReportListPage.routeName: (context) => const ReportListPage(),
  ReportFilterPage.routeName: (context) => const ReportFilterPage(),
  ReportDetailsPage.routeName: (context) => const ReportDetailsPage(),
  ReportLocationPage.pickerRouteName: (context) =>
      const ReportLocationPage.picker(),
  ReportLocationPage.viewRouteName: (context) =>
      const ReportLocationPage.view(),
  ImageViewerPage.routeName: (context) => const ImageViewerPage(),
  SettingsPage.employeeRouteName: (context) => const SettingsPage.employee(),
  SettingsPage.managerRouteName: (context) => const SettingsPage.manager(),
  PointSettingPage.routeName: (context) => const PointSettingPage(),
  ImportExportPage.routeName: (context) => const ImportExportPage(),
  ReportSettingPage.routeName: (context) => const ReportSettingPage(),
  ObservationEventSettingPage.routeName: (context) =>
      const ObservationEventSettingPage(),
  ObservationChecklistSettingPage.routeName: (context) =>
      const ObservationChecklistSettingPage(),
  ObservationEventPage.createModeRouteName: (context) =>
      const ObservationEventPage.create(),
  ObservationEventPage.editModerouteName: (context) =>
      const ObservationEventPage.edit(),
  ObservationEventDetailsPage.routeName: (context) =>
      const ObservationEventDetailsPage(),
  ObservationDetailPage.createModeRouteName: (context) =>
      const ObservationDetailPage.create(),
  ObservationDetailPage.editModerouteName: (context) =>
      const ObservationDetailPage.edit(),
  DashboardAdminPage.routeName: (context) => DashboardAdminPage(),
  RiskLevelSettingsPage.routeName: (context) => const RiskLevelSettingsPage(),
  CompanyOnboarding.routeName: (context) => const CompanyOnboarding(),
  CompanyDetails.routeName: (context) => const CompanyDetails(),
};
