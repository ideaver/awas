import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KdividerWidget extends StatelessWidget {
  final double horizontalMargin;
  const KdividerWidget({super.key, this.horizontalMargin = defaultMargin});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      indent: horizontalMargin,
      endIndent: horizontalMargin,
      color: LightColors.kDarkGreyColor.withOpacity(0.5),
    );
  }
}
