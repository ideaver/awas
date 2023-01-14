import '/res/widgets/kdivider_widget.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KappBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final List<Widget>? actions;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;

  const KappBarWidget({
    Key? key,
    required this.title,
    this.subTitle,
    this.actions,
    this.centerTitle = true,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return appBarWidget();
  }

  AppBar appBarWidget() {
    return AppBar(
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
      actions: actions,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: SizedBox(
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
          )),
    );
  }
}
