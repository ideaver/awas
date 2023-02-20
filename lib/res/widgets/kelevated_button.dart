// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '/res/theme/colors/light_colors.dart';

// ignore: must_be_immutable
class KelevatedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final IconData? trailingIcon;
  final bool keyboardShow;
  final double? elevation;
  final Color? shadowColor;
  final bool showBackground;

  const KelevatedButtonWidget({
    Key? key,
    this.onPressed,
    required this.title,
    this.backgroundColor = LightColors.kPrimaryColor,
    this.textColor = LightColors.kWhiteColor,
    this.icon,
    this.trailingIcon,
    this.keyboardShow = false,
    this.elevation,
    this.shadowColor,
    this.showBackground = false,
  }) : super(key: key);

  //TODO: work on hide on scroll
  const KelevatedButtonWidget.floating({
    required String title,
    required void Function() onPressed,
    IconData? icon,
    IconData? trailingIcon,
    double? elevation,
    int? shadowColor,
    final bool? showBackground,
  }) : this(
          keyboardShow: true,
          title: title,
          onPressed: onPressed,
          icon: icon,
          trailingIcon: trailingIcon,
          showBackground: true,
        );

  @override
  Widget build(BuildContext context) {
    if (keyboardShow) {
      return MediaQuery.of(context).viewInsets.bottom == 0.0
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: defaultMargin,
              ),
              decoration: showBackground
                  ? BoxDecoration(
                      color: LightColors.kBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          offset: const Offset(0, -4),
                          blurRadius: 6,
                        )
                      ],
                    )
                  : null,
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
        icon: Icon(
          icon,
          color: textColor,
          size: icon == null ? 0 : null,
        ),

        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shadowColor: shadowColor,
          disabledBackgroundColor: LightColors.kPrimaryColor.withOpacity(0.2),
          backgroundColor: backgroundColor,
          alignment: Alignment.center,
          side: backgroundColor != LightColors.kWhiteColor
              ? null
              : const BorderSide(
                  color: LightColors.kPrimaryColor,
                ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(defaultCircular / 2), // <-- Radius
          ),
        ),
        onPressed: onPressed,
        // label: Text(
        //   title,
        //   style: LightColors.whiteTextStyle.copyWith(
        //     color: onPressed != null ? textColor : LightColors.kWhiteColor,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: LightColors.whiteTextStyle.copyWith(
                color: onPressed != null ? textColor : LightColors.kWhiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            trailingIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      trailingIcon,
                      color: textColor,
                      size: 22,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
