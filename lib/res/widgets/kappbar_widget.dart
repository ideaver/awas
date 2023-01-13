import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KappBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final List<Widget>? actions;
  final bool? centerTitle;

  const KappBarWidget({
    Key? key,
    required this.title,
    this.subTitle,
    this.actions,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return appBarWidget();
  }

  AppBar appBarWidget() {
    return AppBar(
      automaticallyImplyLeading: true,
      toolbarHeight: 60,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: LightColors.kDarkGreyColor,
            size: 30,
          )),
      backgroundColor: LightColors.kBackgroundColor,
      elevation: 0,
      centerTitle: subTitle != null ? false : centerTitle,
      title: subTitle != null
          ? Row(
              children: [
                Text(
                  title,
                  style: LightColors.titleTextStyle.copyWith(fontSize: 18.0),
                ),
                Text(
                  subTitle!,
                  style: LightColors.subTitle2TextStyle,
                )
              ],
            )
          : Text(
              title,
              style: LightColors.titleTextStyle.copyWith(fontSize: 18.0),
            ),
      actions: actions != null
          ? [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Log out',
                    style: LightColors.subTitle2TextStyle,
                  ))
            ]
          : null,
    );
  }
}
