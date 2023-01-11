import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KcardWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double elevation;
  final Color? color;

  const KcardWidget(
      {super.key,
      required this.child,
      this.height,
      this.elevation = defaultMargin,
      this.color = LightColors.kPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        elevation: elevation,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCircular),
        ),
        child: InkWell(
            onTap: () {},
            splashColor: LightColors.kSecondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: child,
            )));
  }
}
