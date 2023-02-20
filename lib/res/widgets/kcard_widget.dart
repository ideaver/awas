// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KcardWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double elevation;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;

  const KcardWidget({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.elevation = defaultMargin,
    this.color = LightColors.kPrimaryColor,
    this.onTap,
    this.padding = const EdgeInsets.all(defaultMargin),
    this.borderColor,
  });

  KcardWidget.tile({
    final IconData? leadingIcon,
    required final String title,
    final IconData? traillingIcon,
    final Color? color = LightColors.kInfoColor,
  }) : this(
          elevation: 0.0,
          child: Row(
            children: [
              Icon(
                leadingIcon,
                color: LightColors.kBackgroundColor,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  title,
                  style: LightColors.whiteTextStyle,
                ),
              ),
              SizedBox(width: traillingIcon != null ? 10.0 : 0),
              traillingIcon != null
                  ? Icon(traillingIcon, color: LightColors.kWhiteColor)
                  : const SizedBox(),
            ],
          ),
          color: color,
        );

  @override
  Widget build(BuildContext context) {
    final Widget kChild = Padding(
      padding: padding,
      child: child,
    );

    return SizedBox(
      height: height,
      width: width,
      child: Card(
        color: color,
        elevation: elevation,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            defaultCircular,
          ), // if you need this
          side: BorderSide(
            color: borderColor != null ? borderColor! : Colors.transparent,
            width: 1,
          ),
        ),
        child: onTap != null
            ? InkWell(
                onTap: onTap,
                splashColor: LightColors.kSecondaryColor,
                child: kChild,
              )
            : kChild,
      ),
    );
  }
}
