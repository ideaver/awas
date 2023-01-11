import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KcardWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double elevation;

  const KcardWidget(
      {super.key,
      required this.child,
      this.height,
      this.elevation = defaultMargin});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: LightColors.kPrimaryColor,
        elevation: elevation,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCircular),
        ),
        child: InkWell(
            onTap: () {},
            splashColor: LightColors.kSecondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: 20),
              child: child,
            )));
  }
}
