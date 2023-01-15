import 'package:flutter/material.dart';

import '/res/theme/colors/light_colors.dart';

// ignore: must_be_immutable
class KelevatedButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;
  final bool keyboardShow;

  const KelevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = LightColors.kPrimaryColor,
    this.textColor = LightColors.kWhiteColor,
    this.icon,
    this.keyboardShow = false,
  }) : super(key: key);

  // ignore: use_key_in_widget_constructors
  const KelevatedButtonWidget.floating(
      {required String title, required void Function() onPressed, Widget? icon})
      : this(
            keyboardShow: true, title: title, onPressed: onPressed, icon: icon);

  @override
  Widget build(BuildContext context) {
    if (keyboardShow) {
      return MediaQuery.of(context).viewInsets.bottom == 0.0
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin * 2),
              child: elevatedButtonWidget(),
            )
          : const SizedBox();
    }
    return elevatedButtonWidget();
  }

  SizedBox elevatedButtonWidget() {
    return SizedBox(
      height: 40,
      child: ElevatedButton.icon(
        icon: icon ?? const SizedBox(),
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: const BorderSide(
              color: LightColors.kPrimaryColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(defaultCircular / 2), // <-- Radius
            )),
        onPressed: onPressed,
        label: Text(
          title,
          style: LightColors.whiteTextStyle.copyWith(color: textColor),
        ),
      ),
    );
  }
}
