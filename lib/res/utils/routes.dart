import 'package:flutter/material.dart';

import '../../view/all_screen_view.dart';
import '../../view/login/forgot_pass_view.dart';
import '../../view/login/login_view.dart';
import '../../view/login/terms_view.dart';
import '../../view/main/main_view.dart';
import '../../view/menu_view.dart';
import '../../view/report/camera_view.dart';
import '../../view/report/five_why_quest_form_view.dart';
import '../../view/report/image_viewer_view.dart';
import '../../view/report/report_location_view.dart';
import '../../view/settings/import_export_view.dart';
import '../../view/settings/observation/observation_add_edit_view.dart';
import '../../view/settings/observation/observation_detail_view.dart';
import '../../view/settings/observation/observation_event_details_view.dart';
import '../../view/settings/observation/observation_event_setting_view.dart';
import '../../view/settings/risk_level_settings_view.dart';
import '../../view/user/chat_room_view.dart';
import '../../view/user/create_user_view.dart';
import '../../view/user/thank_you_view.dart';
import '../../view/user/user_view.dart';
import '../../view/dashboard/dashboard_employee_view.dart';
import '../../view/dashboard/dashboard_manager_view.dart';
import '../../view/report/report_details_view.dart';
import '../../view/report/report_filter_view.dart';
import '../../view/report/report_form_view.dart';
import '../../view/report/report_list_view.dart';
import '../../view/report/report_loading_view.dart';
import '../../view/settings/observation/observation_checklist_setting_view.dart';
import '../../view/settings/point_setting_view.dart';
import '../../view/settings/report_setting_view.dart';
import '../../view/settings/settings_view.dart';
import '../../view/user/inbox_view.dart';
import '../../view/user/point_transactions_view.dart';
import '../../view/user/user_filter_view.dart';
import '../../view/user/user_list_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/menu': (context) => const MenuView(),
  '/all-screen': (context) => const AllScreenView(),
  MainView.routeName: (context) => const MainView(),
  LoginView.employeeRoleRouteName: (context) => const LoginView.employeeRole(),
  LoginView.managerRoleRouteName: (context) => const LoginView.managerRole(),
  ForgotPassView.routeName: (context) => const ForgotPassView(),
  ThankYouView.profileUpdaterouteName: (context) =>
      const ThankYouView.profileUpdated(),
  TermsView.routeName: (context) => const TermsView(),
  UserView.editUserRouteName: (context) => const UserView.edit(),
  UserView.viewAsMeRouteName: (context) => const UserView.viewAsMe(),
  UserView.viewAsOtherRouteName: (context) => const UserView.viewAsOther(),
  UserListView.routeName: (context) => const UserListView(),
  UserFilterView.routeName: (context) => const UserFilterView(),
  CreateUserView.routeName: (context) => const CreateUserView(),
  ChatRoomView.routeName: (context) => const ChatRoomView(),
  InboxView.routeName: (context) => const InboxView(),
  PointTransactionsView.viewAsMeRouteName: (context) =>
      const PointTransactionsView.viewAsMe(),
  DashboardEmployeeView.routeName: (context) => const DashboardEmployeeView(),
  DashboardManagerView.routeName: (context) => const DashboardManagerView(),
  CameraView.routeName: (context) => const CameraView(),
  ReportLoadingView.routeName: (context) => const ReportLoadingView(),
  ReportFormView.routeName: (context) => const ReportFormView(),
  ReportListView.routeName: (context) => const ReportListView(),
  ReportFilterView.routeName: (context) => const ReportFilterView(),
  ReportDetailsView.routeName: (context) => const ReportDetailsView(),
  ReportLocationView.pickerRouteName: (context) =>
      const ReportLocationView.picker(),
  ReportLocationView.viewRouteName: (context) =>
      const ReportLocationView.view(),
  ImageViewerView.routeName: (context) => const ImageViewerView(),
  SettingsView.employeeRouteName: (context) => const SettingsView.employee(),
  SettingsView.managerRouteName: (context) => const SettingsView.manager(),
  PointSettingView.routeName: (context) => const PointSettingView(),
  ImportExportView.routeName: (context) => const ImportExportView(),
  ReportSettingView.routeName: (context) => const ReportSettingView(),
  ObservationEventSettingView.routeName: (context) =>
      const ObservationEventSettingView(),
  ObservationChecklistSettingView.routeName: (context) =>
      const ObservationChecklistSettingView(),
  ObservationEventView.createModeRouteName: (context) =>
      const ObservationEventView.create(),
  ObservationEventView.editModerouteName: (context) =>
      const ObservationEventView.edit(),
  ObservationEventDetailsView.routeName: (context) =>
      const ObservationEventDetailsView(),
  ObservationDetailView.createModeRouteName: (context) =>
      const ObservationDetailView.create(),
  ObservationDetailView.editModerouteName: (context) =>
      const ObservationDetailView.edit(),
  RiskLevelSettingsView.routeName: (context) => const RiskLevelSettingsView(),
  FiveWhyQuestFormView.routeName: (context) => const FiveWhyQuestFormView(),
};
