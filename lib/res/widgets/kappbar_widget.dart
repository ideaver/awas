import 'package:flutter/services.dart';

import '/res/widgets/kdivider_widget.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KappBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double elevation;
  final BuildContext context;
  final String? title;
  final String? subTitle;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool automaticallyImplyLeading;
  final Widget? bottom;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Widget? leading;
  final Widget? titleWidget;

  const KappBarWidget(
      {Key? key,
      this.title,
      this.subTitle,
      this.actions,
      this.centerTitle = true,
      this.automaticallyImplyLeading = true,
      this.bottom,
      this.backgroundColor,
      required this.context,
      this.systemOverlayStyle,
      this.leading,
      this.titleWidget,
      this.elevation = 0.0})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 120 : 60);

  @override
  Widget build(BuildContext context) {
    return appBarWidget();
  }

  AppBar appBarWidget() {
    //TODO: Change to sliver app bar to hide on scroll
    return AppBar(
      systemOverlayStyle: systemOverlayStyle,
      leadingWidth: leading != null ? double.infinity : null,
      leading: automaticallyImplyLeading
          ? Align(
              alignment: Alignment.centerLeft,
              child: leading ??
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: backgroundColor != null
                          ? LightColors.kBackgroundColor
                          : LightColors.kDarkGreyColor,
                      size: 30,
                    ),
                  ),
            )
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      titleSpacing: 0,
      backgroundColor: backgroundColor ?? LightColors.kBackgroundColor,
      elevation: elevation,
      centerTitle: subTitle != null ? false : centerTitle,
      title: titleWidget ??
          Row(
            children: [
              Text(
                title ?? 'null',
                style: LightColors.titleTextStyle.copyWith(
                    fontSize: 18.0,
                    color: backgroundColor != null
                        ? LightColors.kBackgroundColor
                        : null),
              ),
              const SizedBox(
                width: defaultMargin / 3,
              ),
              subTitle != null
                  ? Text(
                      subTitle!,
                      style: LightColors.subTitle2TextStyle.copyWith(
                          color: backgroundColor != null
                              ? LightColors.kBackgroundColor
                              : null),
                    )
                  : const SizedBox()
            ],
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
