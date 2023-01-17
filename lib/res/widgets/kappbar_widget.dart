import '/res/widgets/kdivider_widget.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KappBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final List<Widget>? actions;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  const KappBarWidget({
    Key? key,
    required this.title,
    this.subTitle,
    this.actions,
    this.centerTitle = true,
    this.bottom,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 130 : 52);

  @override
  Widget build(BuildContext context) {
    return appBarWidget();
  }

  AppBar appBarWidget() {
    //TODO: Change to sliver app bar to hide on scroll
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_left_rounded,
            color: backgroundColor != null
                ? LightColors.kBackgroundColor
                : LightColors.kDarkGreyColor,
            size: 30,
          )),
      backgroundColor: backgroundColor ?? LightColors.kBackgroundColor,
      elevation: 0.0,
      centerTitle: subTitle != null ? false : centerTitle,
      title: subTitle != null
          ? Row(
              children: [
                Text(
                  title,
                  style: LightColors.titleTextStyle.copyWith(
                      fontSize: 18.0,
                      color: backgroundColor != null
                          ? LightColors.kBackgroundColor
                          : null),
                ),
                const SizedBox(
                  width: defaultMargin / 3,
                ),
                Text(
                  subTitle!,
                  style: LightColors.subTitle2TextStyle.copyWith(
                      color: backgroundColor != null
                          ? LightColors.kBackgroundColor
                          : null),
                )
              ],
            )
          : Text(
              title,
              style: LightColors.titleTextStyle.copyWith(fontSize: 18.0),
            ),
      actions: actions,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                color: LightColors.kBackgroundColor,
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      const KdividerWidget(),
                      bottom as Widget,
                    ],
                  ),
                ),
              ))
          : null,
    );
  }
}