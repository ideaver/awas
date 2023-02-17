// ignore_for_file: use_key_in_widget_constructors

import '/view/login/login_page.dart';
import '/view/settings/import_export_page.dart';
import '/view/settings/point_setting_page.dart';
import '/view/settings/report_setting_page.dart';
import '/view/user/user_page.dart';

import '../../res/utils/enums.dart';
import '../../res/utils/globals.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/kdivider_widget.dart';
import '/res/widgets/kscrollbar_widget.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

import 'observation/observation_event_setting_page.dart';
import 'risk_level_settings_page.dart';

class SettingsPage extends StatelessWidget {
  final Role userRole;

  static const String employeeRouteName = '/settings-employee';
  static const String managerRouteName = '/settings-manager';

  const SettingsPage({super.key, required this.userRole});

  const SettingsPage.employee() : this(userRole: Role.employee);
  const SettingsPage.manager() : this(userRole: Role.manager);
  const SettingsPage.superUser() : this(userRole: Role.superUser);
//TODO: slice superuser UI
  @override
  Widget build(BuildContext context) {
    const String commingSoonString = 'Coming Soon';
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      appBar: KappBarWidget(context: context, title: 'Settings'),
      body: KscrollBarWidget(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(defaultMargin),
          children: [
            Text(
              'Account'.toUpperCase(),
              style: LightColors.subTitle3TextStyle,
            ),
            listTileWidget(
              onTap: () {
                Navigator.pushNamed(context, UserPage.viewAsMeRouteName);
              },
              title: 'Personal information',
              icon: Icons.person,
            ),
            listTileWidget(
              onTap: () {
                //TODO: Navigate to Privacy settings

                ksnackBarWidget(context, commingSoonString);
              },
              title: 'Privacy',
              icon: Icons.privacy_tip,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultMargin),
              child: KdividerWidget(
                opacity: 1,
              ),
            ),
            Text(
              'Appearance'.toUpperCase(),
              style: LightColors.subTitle3TextStyle,
            ),
            listTileWidget(
                onTap: () {
                  ksnackBarWidget(context, commingSoonString);
                },
                title: 'Text size',
                icon: Icons.format_size,
                subtitle: 'Medium'),
            listTileWidget(
                onTap: () {
                  ksnackBarWidget(context, commingSoonString);
                },
                title: 'Language',
                icon: Icons.format_size,
                subtitle: 'English'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultMargin),
              child: KdividerWidget(
                opacity: 1,
              ),
            ),
            userRole == Role.manager
                ? managerListTiles(context, commingSoonString)
                : const SizedBox.shrink(),
            Text(
              'Other'.toUpperCase(),
              style: LightColors.subTitle3TextStyle,
            ),
            listTileWidget(
              onTap: () {
                ksnackBarWidget(context, commingSoonString);
              },
              title: 'Help & Support',
              icon: Icons.help,
            ),
            listTileWidget(
              onTap: () {
                ksnackBarWidget(context, commingSoonString);
              },
              title: 'Feedback & Bug Report',
              icon: Icons.insert_emoticon,
            ),
            listTileWidget(
              onTap: () {
                ksnackBarWidget(context, commingSoonString);
              },
              title: 'About & Version',
              icon: Icons.perm_device_info,
            ),
            const SizedBox(
              height: defaultMargin * 2,
            ),
            KelevatedButtonWidget(
                icon: Icons.logout,
                backgroundColor: LightColors.kSecondaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
                title: 'Logout'),
            Image.asset(
              'assets/logo.png',
              scale: 3,
            )
          ],
        ),
      ),
    );
  }

  Widget managerListTiles(BuildContext context, String commingSoonString) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Report'.toUpperCase(),
          style: LightColors.subTitle3TextStyle,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, ImportExportPage.routeName);
          },
          title: 'Import & Export Data',
          icon: Icons.sync_alt,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, PointSettingPage.routeName);
          },
          title: 'Point Settings',
          icon: Icons.stars_rounded,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, RiskLevelSettingsPage.routeName);
          },
          title: 'Risk Level Settings',
          icon: Icons.manage_search_rounded,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, ReportSettingPage.routeName);
          },
          title: 'Report Settings',
          icon: Icons.receipt,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, ObservationEventSettingPage.routeName);
          },
          title: 'Observations Settings',
          icon: Icons.manage_search_rounded,
        ),
        const SizedBox(
          height: defaultMargin * 2,
        ),
      ],
    );
  }

  Padding listTileWidget(
      {required void Function() onTap,
      required String title,
      required IconData icon,
      String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin),
      child: ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.only(left: 0.0, right: defaultMargin / 4),
        tileColor: LightColors.kBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultCircular)),
        leading: Container(
          width: 55,
          height: double.infinity,
          decoration: BoxDecoration(
              color: LightColors.kPrimaryColor, borderRadius: kBorderRadius),
          child: Icon(
            icon,
            color: LightColors.kBackgroundColor,
          ),
        ),
        title: Text(
          title,
          style: LightColors.black2TextStyle,
        ),
        trailing: subtitle != null
            ? SizedBox(
                width: 90,
                child: Row(
                  children: [
                    Text(
                      subtitle,
                      style: LightColors.subTitle2TextStyle,
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              )
            : const Icon(Icons.chevron_right),
      ),
    );
  }
}
