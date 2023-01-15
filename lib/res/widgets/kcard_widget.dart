import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KcardWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double elevation;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;

  const KcardWidget(
      {super.key,
      required this.child,
      this.height,
      this.elevation = defaultMargin,
      this.color = LightColors.kPrimaryColor,
      this.onTap,
      this.padding = const EdgeInsets.all(defaultMargin),
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    final Widget kChild = Padding(
      padding: padding,
      child: child,
    );

    return SizedBox(
      height: height,
      child: Card(
          color: color,
          elevation: elevation,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(defaultCircular), // if you need this
            side: BorderSide(
              color: borderColor != null ? borderColor! : Colors.transparent,
              width: 1,
            ),
          ),
          child: onTap != null
              ? InkWell(
                  onTap: onTap,
                  splashColor: LightColors.kSecondaryColor,
                  child: kChild)
              : kChild),
    );
  }
}
