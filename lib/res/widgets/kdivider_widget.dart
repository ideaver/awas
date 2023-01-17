import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KdividerWidget extends StatelessWidget {
  final double horizontalMargin;
  final double opacity;
  const KdividerWidget(
      {super.key, this.horizontalMargin = defaultMargin, this.opacity = 0.5});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2.0,
      indent: horizontalMargin,
      endIndent: horizontalMargin,
      color: LightColors.kDarkGreyColor.withOpacity(opacity),
    );
  }
}
