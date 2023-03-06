// ignore_for_file: use_key_in_widget_constructors

import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/utils/globals.dart';

import '../user/user_view.dart';
import 'point_setting_view.dart';
import 'report_setting_view.dart';

import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:awas_core/res/widgets/kelevated_button.dart';
import 'package:awas_core/res/widgets/kdivider_widget.dart';
import 'package:awas_core/res/widgets/kscrollbar_widget.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

import 'import_export_view.dart';
import 'observation/observation_event_setting_view.dart';
import 'risk_level_settings_view.dart';

class SettingsView extends StatelessWidget {
  final RoleEnum userRole;

  static const String employeeRouteName = '/settings-employee';
  static const String managerRouteName = '/settings-manager';

  const SettingsView({super.key, required this.userRole});

  const SettingsView.employee() : this(userRole: RoleEnum.employee);
  const SettingsView.manager() : this(userRole: RoleEnum.manager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      appBar: KappBarWidget(context: context, title: 'Settings'),
      body: KscrollBarWidget(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(defaultMargin),
          children: [
            accountMenus(context),
            divider(),
            appearanceMenus(context),
            divider(),
            managerMenus(context),
            otherMenus(context),
            logOutButton(context),
            logo(),
          ],
        ),
      ),
    );
  }

  Widget accountMenus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account'.toUpperCase(),
          style: LightColors.subTitle3TextStyle,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, UserView.viewAsMeRouteName);
          },
          title: 'Personal information',
          icon: Icons.person,
        ),
        listTileWidget(
          onTap: () {
            //TODO: Navigate to Privacy settings

            ksnackBarWidget(context, 'Coming Soon');
          },
          title: 'Privacy',
          icon: Icons.privacy_tip,
        ),
      ],
    );
  }

  Widget appearanceMenus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appearance'.toUpperCase(),
          style: LightColors.subTitle3TextStyle,
        ),
        listTileWidget(
            onTap: () {
              ksnackBarWidget(context, 'Coming Soon');
            },
            title: 'Text size',
            icon: Icons.format_size,
            subtitle: 'Medium'),
        listTileWidget(
          onTap: () {
            ksnackBarWidget(context, 'Coming Soon');
          },
          title: 'Language',
          icon: Icons.format_size,
          subtitle: 'English',
        ),
      ],
    );
  }

  Widget otherMenus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other'.toUpperCase(),
          style: LightColors.subTitle3TextStyle,
        ),
        listTileWidget(
          onTap: () {
            ksnackBarWidget(context, 'Coming Soon');
          },
          title: 'Help & Support',
          icon: Icons.help,
        ),
        listTileWidget(
          onTap: () {
            ksnackBarWidget(context, 'Coming Soon');
          },
          title: 'Feedback & Bug Report',
          icon: Icons.insert_emoticon,
        ),
        listTileWidget(
          onTap: () {
            ksnackBarWidget(context, 'Coming Soon');
          },
          title: 'About & Version',
          icon: Icons.perm_device_info,
        ),
      ],
    );
  }

  Widget managerMenus(BuildContext context) {
    if (userRole != RoleEnum.manager) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Report'.toUpperCase(),
          style: LightColors.subTitle3TextStyle,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, ImportExportView.routeName);
          },
          title: 'Import & Export Data',
          icon: Icons.sync_alt,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, PointSettingView.routeName);
          },
          title: 'Point Settings',
          icon: Icons.stars_rounded,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, ReportSettingView.routeName);
          },
          title: 'Report Settings',
          icon: Icons.receipt,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, ObservationEventSettingView.routeName);
          },
          title: 'Observations Settings',
          icon: Icons.manage_search_rounded,
        ),
        listTileWidget(
          onTap: () {
            Navigator.pushNamed(context, RiskLevelSettingsView.routeName);
          },
          title: 'Risk Level Settings',
          icon: Icons.manage_search_rounded,
        ),
        const SizedBox(
          height: defaultMargin * 2,
        ),
      ],
    );
  }

  Widget logOutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin * 2),
      child: KelevatedButtonWidget(
        icon: Icons.logout,
        backgroundColor: LightColors.kSecondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/menu');
        },
        title: 'Logout',
      ),
    );
  }

  Widget logo() {
    return Image.asset(
      'assets/logo.png',
      scale: 3,
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
        contentPadding: const EdgeInsets.only(
          left: 0.0,
          right: defaultMargin / 4,
        ),
        tileColor: LightColors.kBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCircular),
        ),
        leading: Container(
          width: 55,
          height: double.infinity,
          decoration: BoxDecoration(
            color: LightColors.kPrimaryColor,
            borderRadius: kBorderRadius,
          ),
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

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: defaultMargin),
      child: KdividerWidget(
        opacity: 1,
      ),
    );
  }
}
