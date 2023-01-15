import 'package:flutter/material.dart';
import '../theme/colors/light_colors.dart';

class KexpansionTileWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool? initiallyExpanded;
  final EdgeInsetsGeometry? childrenPadding;
  const KexpansionTileWidget({
    super.key,
    required this.title,
    required this.children,
    this.initiallyExpanded,
    this.childrenPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        initiallyExpanded: initiallyExpanded ?? true,
        title: Text(
          title,
          style:
              LightColors.blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        tilePadding: const EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, top: defaultMargin),
        childrenPadding: childrenPadding ?? const EdgeInsets.all(defaultMargin),
        children: children);
  }
}
