import 'package:flutter/material.dart';

import 'package:awas/res/utils/globals.dart';
import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/widgets/custom_bottom_navbar.dart';

import '../dashboard/dashboard_employee_view.dart';
import '../dashboard/dashboard_manager_view.dart';
import '../report/camera_view.dart';
import '../report/report_list_view.dart';
import '../settings/settings_view.dart';
import '../user/inbox_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<CustomBottomNavbarModel> navItems = [
    CustomBottomNavbarModel(
      pageScreen: currentUserRole == RoleEnum.employee
          ? const DashboardEmployeeView()
          : const DashboardManagerView(),
      icon: Icons.home,
      label: 'Home',
    ),
    CustomBottomNavbarModel(
      pageScreen: const ReportListView(),
      icon: Icons.featured_play_list_rounded,
      label: 'Report',
    ),
    CustomBottomNavbarModel(
      pageScreen: const InboxView(),
      icon: Icons.notifications,
      label: 'Inbox',
    ),
    CustomBottomNavbarModel(
      pageScreen: currentUserRole == RoleEnum.employee
          ? const SettingsView.employee()
          : const SettingsView.manager(),
      icon: Icons.settings,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavbar(
      customBottomNavbarModel: navItems,
      onTapFab: () {
        // TODO

        // setState(() {
        //   clickedCentreFAB =
        //       !clickedCentreFAB; //to update the animated container
        // });
        // Timer(const Duration(seconds: 1),
        //     () => Navigator.pushNamed(context, CameraPage.routeName));

        Navigator.pushNamed(context, CameraView.routeName);
      },
      userRole: currentUserRole,
    );
  }
}
