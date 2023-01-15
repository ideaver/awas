import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KscrollBarWidget extends StatelessWidget {
  final Widget child;
  const KscrollBarWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
        thumbColor: LightColors.kPrimaryColor,
        radius: const Radius.circular(defaultCircular),
        thumbVisibility: true,
        thickness: 8.0,
        child: child);
  }
}
