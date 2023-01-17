import '../../res/const.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/kdivider_widget.dart';
import '/res/widgets/kscrollbar_widget.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final Role role;

  const SettingsPage({super.key, required this.role});

  const SettingsPage.employee() : this(role: Role.employee);
  const SettingsPage.manager() : this(role: Role.manager);
  const SettingsPage.superUser() : this(role: Role.superUser);
//TODO: slice employee UI
//TODO: slice superuser UI
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
            Text(
              'Account'.toUpperCase(),
              style: LightColors.subTitle3TextStyle,
            ),
            listTileWidget(
              onTap: () {},
              title: 'Personal information',
              icon: Icons.person,
            ),
            listTileWidget(
              onTap: () {
                //TODO: Navigate to Privacy settings
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
                onTap: () {},
                title: 'Text size',
                icon: Icons.format_size,
                subtitle: 'Medium'),
            listTileWidget(
                onTap: () {},
                title: 'Language',
                icon: Icons.format_size,
                subtitle: 'English'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultMargin),
              child: KdividerWidget(
                opacity: 1,
              ),
            ),
            Text(
              'Other'.toUpperCase(),
              style: LightColors.subTitle3TextStyle,
            ),
            listTileWidget(
              onTap: () {},
              title: 'Help & Support',
              icon: Icons.help,
            ),
            listTileWidget(
              onTap: () {},
              title: 'Feedback & Bug Report',
              icon: Icons.insert_emoticon,
            ),
            listTileWidget(
              onTap: () {},
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
                  Navigator.pop(context);
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
